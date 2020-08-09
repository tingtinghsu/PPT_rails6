# Command for special gems inside this repo

[Hirb](https://github.com/cldwalker/hirb) :  rendering a view based on the object's class  for console applications 

  - rails c:  
    - `require 'Hirb'`  
    - `Hirb.enable`  

[Paranoia](https://github.com/rubysherpas/paranoia) :  calling `destroy` on an ActiveRecord object doesn't actually destroy the database record (it just *hides* it)

  - Model: `acts_as_paranoid`  
  - Eg. 撈出假刪除的看板 `Board.with_deleted`

