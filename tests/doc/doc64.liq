type storage = (string, int) map
let%entry main () map =
  let negated_map = Map.map (fun (_key, v) -> - v) map in
  [], negated_map
