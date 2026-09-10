import { Pool } from 'pg';

type SqlFn = (strings: TemplateStringsArray, ...values: any[]) => Promise<any[]>;

let _sql: SqlFn | null = null;

function makeSqlFn(pool: Pool): SqlFn {
  return async (strings: TemplateStringsArray | string, ...values: any[]) => {
    let text: string;
    if (typeof strings === 'string') {
      text = strings;
    } else {
      text = strings[0];
      for (let i = 0; i < values.length; i++) {
        text += `$${i + 1}` + strings[i + 1];
      }
    }
    const res = await pool.query(text, values);
    return res.rows;
  };
}

export function getSql(): SqlFn {
  if (!_sql) {
    const pool = new Pool({
      connectionString:
        process.env.DATABASE_URL ||
        'postgresql://postgres:KanPosVN%402026@localhost:5432/kanposvn?sslmode=disable',
    });
    _sql = makeSqlFn(pool);
  }
  return _sql;
}