async function connect() {
    if (global.connection)
        return global.connection.connect();
 
    const { Pool } = require('pg');
    console.log("Criou pool de conexões no PostgreSQL!");
    const pool = new Pool({
        connectionString: process.env.CONNECTION_STRING
    });
 
    //guardando para usar sempre o mesmo
    global.connection = pool;
    return pool.connect();
}

async function disconnect() {
    const client = await connect();
    client.release();
}

async function selectNow() {
    const client = await connect();
    //apenas testando a conexão   
    const res = await client.query('SELECT NOW()');
    client.release();
    return res.rows[0];
}

async function selectCadCli(sql) {
    const client = await connect();
    const res = await client.query(sql);
    client.release();
    return res.rows;
}

async function insert(table, entitie){
    // const client = await connect();
    // ${entitie.keys()}

    // let fields = '';
    // let values = '';
    // for (key in entitie) {
    //     const value = typeof(entitie[key]) == 'number' ? entitie[key] : `"${entitie[key]}"`;
    //     if (fields) {
    //         fields = `${fields}, ${key}`;
    //         values = `${values}, ${value}`;
    //     } else {
    //         fields = key;
    //         values = value;
    //     }
    // }
    // console.log(fields);
    // console.log(values);
    // const sql = `INSERT INTO ${table} (${fields}) VALUES (${values})`;

    const fields = [];
    const values = [];

    for (key in entitie) {
        values.push(entitie[key]);
        fields.push(key);
    }
    const params = values.map<String>((v,i) => `$${i}`).toString();
    const sql = `INSERT INTO ${table} (${fields.toString()}) VALUES (${params})`;
    console.log(sql);
    // const sql = 'INSERT INTO clientes(nome,idade,uf) VALUES ($1,$2,$3);';
    // const values = [customer.nome, customer.idade, customer.uf];
    // return await client.query(sql, values);
}

module.exports = { selectNow, selectCadCli, insert };