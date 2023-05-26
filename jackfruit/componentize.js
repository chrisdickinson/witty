import { componentize } from '@bytecodealliance/componentize-js';
import { readFile, writeFile } from 'node:fs/promises';
import { fileURLToPath } from 'url';

const jsSource = await readFile('app.js', 'utf8');
const witSource = await readFile('../wit/component.wit', 'utf8');

const { component } = await componentize(jsSource, witSource);

await writeFile('hello.component.wasm', component);
