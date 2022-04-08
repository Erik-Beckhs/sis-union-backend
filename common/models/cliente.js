'use strict';

module.exports = function(Cliente) {
    Cliente.ListadoDeClientes = (cb) => {
        var ds = Cliente.dataSource
        var sql = `
        select c.id, concat(c.nombre,' ',c.paterno, ' ', c.materno) nombre, c.tipo_doc, c.doc_identidad, c.fecha_nac, c.genero, count(cu.id) cantidad
        FROM cliente c left join cuenta cu on c.id=cu.id_cliente
        GROUP by c.id
        order by c.id desc;
        `;

        ds.connector.query(sql, (err, instance) => {
            if (err) console.error(err);
            //pubsub.publish('/Pedidoreporte/GET', instance);
            cb(err, instance);
        })
    }
    
    Cliente.remoteMethod(
        'ListadoDeClientes',
        {
            http: { verb: 'get' },
            accepts: [
            ],
            returns: { arg: 'data', type: ['any'], root: true },
            description: 'Devuelve el listado de clientes y la cantidad de cuentas que posee'
        }
    )
};
