uses GraphABC;
var
  i: integer;
procedure Draw(x, y, dx, dy: integer);
var
  turn: array [1..1000] of Boolean;
  a, b, d, t: integer;
  f: Boolean;
  i: integer;
begin
  SetWindowSize(800, 600);
  SetWindowCaption('Кривая Хартера-Хейтуэя');
  f := true;
  for a := 1 to 64 do
  begin
    turn[2 * a - 1] := f;
    f := not f;
    turn[2 * a] := turn[a];
  end;
  b := 0;
  d := 1;
  f := false;
  MoveTo(x, y);
  for a := 1 to 128 do
  begin
    for i := 1 to 127 * 4 do
    begin
      b := b + d; x := x + dx; y := y + dy;
      LineTo(x, y);
      if f and not turn[b] or not f and turn[b] then
      begin
        t := dy;
        dy := -dx;
      end
      else
      begin
        t := -dy;
        dy := dx;
      end;
      dx := t;
    end;
    b := b + d; d := -d;
    f := not f;
    x := x + dx; y := y + dy;
    LineTo(x, y);
    if turn[a] then
    begin
      t := dy;
      dy := -dx;
    end
    else
    begin
      t := -dy;
      dy := dx;
    end;
    dx := t;
  end;
end;
var
  x, y, dx, dy: integer;
procedure KeyDown(key: integer);
begin
  i := 0;
  case key of
    VK_Up: begin y := y - 50 end;
    VK_Down: begin y := y + 50 end;
    VK_Left: begin x := x - 50 end;
    VK_Right: begin x := x + 50 end;
    VK_m:
      begin
        i := i + 1;
        x := x + i;
        dx := dx - i;
        dy := dy + i;
        y := y - i;
      end;
    vk_a: if i > 0 then i -= 1;
    vk_d: if i < 4 then i += 1;
    vk_F: 
  end; 
  Window.Clear; 
  draw(x, y, dx, dy);
  redraw;
end;
begin
  LockDrawing;
  x := 200;
  y := 140;
  dx := 0;
  dy := -4;
  draw(x, y, dx, dy);
  redraw;
  onKeyDown += keydown;
end.