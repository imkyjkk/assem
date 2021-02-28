;Date Program (Date.asm)

.MODEL small
.STACK 100h
.386

.data
str1 BYTE "Date: "
str2 BYTE 0Ah,0Dh,"Time: "
year WORD ?
month BYTE ?
day BYTE ?
hour BYTE ?
min BYTE ?
sec BYTE ?
num DWORD ?

.code
dash PROC
        mov ah,6
        mov dl,"-"
        int 21h
        ret
dash ENDP
colon PROC
        mov ah,6
        mov dl,":"
        int 21h
        ret
colon ENDP
main PROC
        mov ax,@data
        mov ds,ax
;Display the date:
        mov ah,40h
        mov bx,1
        mov cx,SIZEOF str1
        mov dx,OFFSET str1
        int 21h

        mov ah,2ah
        int 21h
        mov year,0
        mov year,cx
        mov month,dh
        mov day,dl
        
      
        movzx eax,year
        mov edx,0
        mov ebx,10
        div ebx
        add edx,48
        push edx
        
        ;cwd
        div ebx

  
        
        call dash
        movzx ax,month
        mov dx,0
        mov bx,10
        div bx
        add dx,48
        push dx
        add ax,48
        mov ah,02h
        mov dl,al
        int 21h
        pop dx
        mov dl,dl
        int 21h


        call dash
        movzx ax,day
        mov dx,0
        mov bx,10
        div bx
        add dx,48
        push dx
        add ax,48

        mov ah,02h
        mov dl,al
        int 21h
        pop edx
        mov dl,dl       
        int 21h

;Display the time:
        mov ah,40h
        mov bx,1
        mov cx,SIZEOF str2
        mov dx,OFFSET str2
        int 21h

        mov ah,2ch
        int 21h
        mov hour,ch
        mov min,cl
        mov sec,dh

        movzx ax,hour
        mov dx,0
        mov bx,10
        div bx
        add dx,48
        push dx
        add ax,48
        mov ah,02h
        mov dl,al
        int 21h
        pop dx
        mov dl,dl
        int 21h
        call colon
        
        movzx ax,min
        mov dx,0
        mov bl,10
        div bl
        add dx,48
        push dx
        add ax, 48
        mov ah,02h
        mov dl,al
        int 21h
        pop dx
        mov dl,dl
        int 21h
        call colon
       
        movzx ax,sec
        mov bl,10
        div bl
        add ah,48
        push ax
        add al,48
        mov ah,02h
        mov dl,al
        int 21h
        pop ax
        mov dl,ah
        mov ah,02h
        int 21h
        

        .EXIT
main ENDP


END main
