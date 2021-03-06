xquery version "3.1";

declare namespace anno = "annotate";
(:import module namespace json = "http://www.json.org";:)
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "json";
declare option output:media-type "application/json";

let $file := request:get-parameter('file', '')
let $anno :=
	<anno:anno>
		<anno:entry><anno:range from="" to=""/></anno:entry>
		{doc('/db/apps/edoc/anno.xml')//anno:file[. = $file]/parent::anno:entry}
	</anno:anno>

(:return json:contents-to-json($anno):)
return $anno