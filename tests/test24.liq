[%%version 0.5]

type t = A of int | B | C of (int * nat)

type storage = int

contract type UnitContract = sig
  type storage
  contract type U = sig
    type storage
    val%entry main : parameter:unit -> storage -> (operation list * storage)
  end
  val%entry main : parameter:unit -> storage -> (operation list * storage)
end


let%entry main
    (parameter : UnitContract.U.instance * t)
    storage =

  let (c, m) = parameter in
  match m with
  | A _ ->
    let amount = 0tz in
    let op = Contract.call ~dest:c ~entry:main ~amount () in
    [op], storage
  | B ->
    let op = Contract.call c 0tz main ~parameter:() in
    [op], 0
  | C _ ->
    let op = c.main () ~amount:1tz in
    [op], 1
