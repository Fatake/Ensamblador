//librerias
#include <iostream>
#include <math.h>
//Definiciones
using namespace std;
//funciones
void oct(int arr[]);
int binario(int numero,int arr[]);
void hex(int arr[]);
//main
int main(){
	int valor=0,bin[16],hexn[16],cant=0;	
	cout <<"Convertidor de numeros binarios"<< endl;
	cout <<"Numero a combertir"<<endl<<"->";
	cin >> valor;
	cant=binario(valor,bin);
	hex(bin);
	oct(bin);
	//int bin=0x0;
	//cin:bin>>valor;
	/*esta es la conversion directa cout:bin<<valor ;*/
	return 0;
}
//funciones
//Binario
int binario(int numero,int arr[]){
	int i=0,c=0;
	cout<<endl<<"<.....>"<<endl;
	cout <<"Binario" <<endl;
	for(i=23;i>=0;i--){
		if(numero>=pow(2,i)){
			numero -= pow(2,i);
			arr[i]=1;
			c++;
		}else arr[i]=0;
		if((i%4)==0) cout<<" ";
	}
	for(i=23;i>=0;i--){
		cout <<arr[i];
		if((i%4)==0) cout<<" ";
	}
	return c;
}
//hex
void hex(int arr[]){
	int i;
	cout<<endl<<"<.....>"<<endl;
	cout<<"Hexadecimal"<<endl;
	for(i=0;i<=15;i+=4){
		if(arr[i]&&arr[i+1]&&arr[i+2]&&arr[i+3]) cout <<"F ";
		if(!arr[i]&&arr[i+1]&&arr[i+2]&&arr[i+3]) cout <<"E ";
		if(arr[i]&&!arr[i+1]&&arr[i+2]&&arr[i+3]) cout <<"D ";
		if(!arr[i]&&!arr[i+1]&&arr[i+2]&&arr[i+3]) cout <<"C ";
		if(arr[i]&&arr[i+1]&&!arr[i+2]&&arr[i+3]) cout <<"B ";
		if(!arr[i]&&arr[i+1]&&!arr[i+2]&&arr[i+3]) cout <<"A ";
		if(arr[i]&&!arr[i+1]&&!arr[i+2]&&arr[i+3]) cout <<"9 ";
		if(!arr[i]&&!arr[i+1]&&!arr[i+2]&&arr[i+3]) cout <<"8 ";
		if(arr[i]&&arr[i+1]&&arr[i+2]&&!arr[i+3]) cout <<"7 ";
		if(!arr[i]&&arr[i+1]&&arr[i+2]&&!arr[i+3]) cout <<"6 ";
		if(arr[i]&&!arr[i+1]&&arr[i+2]&&!arr[i+3]) cout <<"5 ";
		if(!arr[i]&&!arr[i+1]&&arr[i+2]&&!arr[i+3]) cout <<"4 ";
		if(arr[i]&&arr[i+1]&&!arr[i+2]&&!arr[i+3]) cout <<"3";
		if(!arr[i]&&arr[i+1]&&!arr[i+2]&&!arr[i+3]) cout <<"2";
		if(arr[i]&&!arr[i+1]&&!arr[i+2]&&!arr[i+3]) cout <<"1";
		if(!arr[i]&&!arr[i+1]&&!arr[i+2]&&!arr[i+3]) cout <<"0 ";
	}
	cout<<endl;
}
//octal
void oct(int arr[]){
	int i;
	cout<<endl<<"<.....>"<<endl;
	cout<<"octal"<<endl;
	for(i=0;i<=12;i+=3){
		if(!arr[i]&&!arr[i+1]&&!arr[i+2]) cout <<"0 ";
		if(arr[i]&&!arr[i+1]&&!arr[i+2]) cout <<"1 ";
		if(!arr[i]&&arr[i+1]&&!arr[i+2]) cout <<"2 ";
		if(arr[i]&&arr[i+1]&&!arr[i+2]) cout <<"3 ";
		if(!arr[i]&&!arr[i+1]&&arr[i+2]) cout <<"4 ";
		if(arr[i]&&!arr[i+1]&&arr[i+2]) cout <<"5 ";
		if(!arr[i]&&arr[i+1]&&arr[i+2]) cout <<"6 ";
		if(arr[i]&&arr[i+1]&&arr[i+2]) cout <<"7 ";
	}
	cout<<endl;
}
