SELECT p.idProducto, p.nombre, p.precio, COALESCE(SUM(v.cantidad * p.precio), 0) AS total_vendido
FROM productos p
LEFT JOIN ventas v ON p.idProducto = v.idProducto
GROUP BY p.idProducto, p.nombre, p.precio;
