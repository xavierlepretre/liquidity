type storage = address

let%entry main () owner =
  let addr = Current.sender () in
  if addr <> owner then
    Current.failwith ("Sender cannot call");
  [], owner
