#!/usr/bin/env node
let body = '';
const stdin = process.stdin;
stdin.setEncoding('utf8')
stdin.on('data', chunk => body += chunk);
stdin.on('end', () => {
  try {
    const data = JSON.parse(body);
    main(data);
    process.exit(0);
  } catch (er) {
    console.error(er);
    process.exit(1);
  }
})

// export interface Annotation {
//   entry: string;
//   description: string;
// }
//
// type DateStr ~= "20191225T050000Z",
//
// export interface Task {
//   id: number;
//   depends: string;
//   description: string;
//   due: string;
//   entry: string;
//   mask: string;
//   modified: string;
//   project: string;
//   recur: string;
//   status: string;
//   tags: string[];
//   uuid: string;
//   annotations: Annotation[];
//   urgency: number;
//   start: string;
//   wait: string;
//   imask?: number;
//   parent: string;
// }

function main(data) {
  const parents = data.filter(x => !x.parent);
  const children = data
    .filter(x => !!x.parent)
    .filter(x => !!x.depends)
    .map(x => {
      const depends = x.depends
        .split(',')
        .map(dependencyId => {
          const parent = parents.find(p => p.uuid === dependencyId);

          // Update dependencyId with first child dependency of parent
          if (parent) {
            const child = data.find(e => e.parent === parent.uuid)
            if (child) {
              return child.uuid;
            }
          }
          return dependencyId;
        })
        .join(',');
      return { ...x, depends };
    });
  console.log(JSON.stringify(children, null, 2));
}
