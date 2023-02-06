Uses  GraphABC;
var (m,wx,wy,g) := (200, 500,450,5);
 
Procedure st(x1,y1,x2,y2,k:integer);
var xn,yn:integer;
begin
 if k>0 then 
  begin 
   xn:=(x1+x2)div 2+(y2-y1)div 2; 
   yn:=(y1+y2) div 2-(x2-x1) div 2;
   st(x2,y2,xn,yn,k-1);
   st(x1,y1,xn,yn,k-1);
  end
 else 
  line(x1,y1,x2,y2);
end;

Procedure KeyDown(k: integer);
begin
 case K of
    VK_Down: wy -= 10;
    VK_Up: wy += 10; 
    VK_Left: wx += 10;  
    VK_Right: wx -= 10;
    VK_Escape: halt(1); //выход
    VK_N: if m < 1000 then m+=1;
    VK_M: if m > 10 then m-=1;
    VK_S: if g < 15 then g+=1;
    VK_X: if g > 2 then g -=1;
   end;
 Window.Clear; 
 st(wx-m,wy,wx+m,wy,g);
 Redraw;
end; 
 
Begin
     SetPenColor(clBlack);
     SetWindowCaption('Кривая Хартера-Хетуэя');
     SetWindowSize(800, 600);
     LockDrawing;
     KeyDown(0);
     OnkeyDown += KeyDown;
End.