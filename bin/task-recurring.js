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

function main(data) {
  const parents = data.filter(x => !x.parent);
  const children = data
    .filter(x => !!x.parent)
    .filter(x => !!x.depends)
    .map(x => {
      const depends = x.depends
        .split(',')
        .map(d => {
          const parent = parents.find(p => p.uuid === d);
          if (parent) {
            const child = data.find(e => e.parent === parent.uuid)
            if (child) {
              return child.uuid;
            }
          }
          return d;
        })
        .join(',');
      return { ...x, depends };
    });
  console.log(JSON.stringify(children, null, 2));
}
