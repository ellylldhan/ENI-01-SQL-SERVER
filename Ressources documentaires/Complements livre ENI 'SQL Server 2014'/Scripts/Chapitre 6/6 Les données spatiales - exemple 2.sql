
DECLARE @triangle GEOMETRY;
DECLARE @segment GEOMETRY
SET @segment='LineString(10 10, 50 10)'
SET @triangle='Polygon((0 0, 5 7, 5 0, 0 0))'
SELECT @triangle.ShortestLineTo(@segment).STAsText();
