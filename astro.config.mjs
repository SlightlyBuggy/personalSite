import { defineConfig } from 'astro/config';

export default defineConfig({
  base: '/hunter',
  trailingSlash: 'always',
  output: 'static',
});
