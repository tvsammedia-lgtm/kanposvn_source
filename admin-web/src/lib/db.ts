import { neon } from '@neondatabase/serverless';

type SqlFn = (strings: TemplateStringsArray, ...values: any[]) => Promise<any[]>;

let _sql: SqlFn | null = null;

export function getSql(): SqlFn {
  if (!_sql) {
    _sql = neon(process.env.DATABASE_URL!);
  }
  return _sql;
}
