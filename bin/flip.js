const fs = require('fs').promises;

async function run() {
  const input = process.argv[2];
  const output = process.argv[3];

  const data = await fs.readFile(input, 'utf8').then(JSON.parse);
  const keys = Object.keys(data[0]);
  const result = {};
  for (const d of data) {
    for (const k of keys) {
      result[k] ||= [];
      result[k].push(d[k]);
    }
  }
  await fs.writeFile(output, JSON.stringify(result, null, 2), 'utf8');
}

async function main() {
  let statusCode = 0;
  try {
    await run();
  } catch (e) {
    console.log(e);
    statusCode = 1;
  }
  process.exit(statusCode);
}

main();
