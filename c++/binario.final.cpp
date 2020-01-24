//librerias
#include <iostream>
#include <math.h>
//Definiciones
using namespace std;
//funciones
void oct(int arr[],int octa[]);
int binario(int numero,int arr[]);
void hex(int arr[],int hexn[]);
//main
int main(){
	int valor=0,bin[16],hexn[16],cant=0;	
	cout <<"Convertidor de numeros binarios"<< endl;
	cout <<"Numero a combertir"<<endl<<"->";
	cin >> valor;
	cant=binario(valor,bin);
	hex(bin,hexn);
	oct(bin, hexn);
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
	for(i=15;i>=0;i--){
		if(numero>=pow(2,i)){
			numero -= pow(2,i);
			arr[i]=1;
			c++;
		}else arr[i]=0;
		if((i%4)==0) cout<<" ";
	}
	for(i=15;i>=0;i--){
		cout <<arr[i];
		if((i%4)==0) cout<<" ";
	}
	return c;
}
//hex
void hex(int arr[],int hexn[]){
	cout<<endl<<"<.....>"<<endl;
	cout<<"Hexadecimal"<<endl;
	for (int i=3; i>-1; i--){
		if(arr[0+(4*i)]&&arr[1+(4*i)]&&arr[2+(4*i)]&&arr[3+(4*i)]) cout <<"F ";
		if(!arr[0+(4*i)]&&arr[1+(4*i)]&&arr[2+(4*i)]&&arr[3+(4*i)]) cout <<"E ";
		if(arr[0+(4*i)]&&!arr[1+(4*i)]&&arr[2+(4*i)]&&arr[3+(4*i)]) cout <<"D ";
		if(!arr[0+(4*i)]&&!arr[1+(4*i)]&&arr[2+(4*i)]&&arr[3+(4*i)]) cout <<"C ";
		if(arr[0+(4*i)]&&arr[1+(4*i)]&&!arr[2+(4*i)]&&arr[3+(4*i)]) cout <<"B ";
		if(!arr[0+(4*i)]&&arr[1+(4*i)]&&!arr[2+(4*i)]&&arr[3+(4*i)]) cout <<"A ";
		if(arr[0+(4*i)]&&!arr[1+(4*i)]&&!arr[2+(4*i)]&&arr[3+(4*i)]) cout <<"9 ";
		if(!arr[0+(4*i)]&&!arr[1+(4*i)]&&!arr[2+i]&&arr[3+(4*i)]) cout <<"8 ";
		if(arr[0+(4*i)]&&arr[1+(4*i)]&&arr[2+(4*i)]&&!arr[3+(4*i)]) cout <<"7 ";
		if(!arr[0+(4*i)]&&arr[1+(4*i)]&&arr[2+(4*i)]&&!arr[3+(4*i)]) cout <<"6 ";
		if(arr[0+(4*i)]&&!arr[1+(4*i)]&&arr[2+(4*i)]&&!arr[3+(4*i)]) cout <<"5 ";
		if(!arr[0+(4*i)]&&!arr[1+(4*i)]&&arr[2+(4*i)]&&!arr[3+(4*i)]) cout <<"4 ";
		if(arr[0+(4*i)]&&arr[1+(4*i)]&&!arr[2+(4*i)]&&!arr[3+(4*i)]) cout <<"3 ";
		if(!arr[0+(4*i)]&&arr[1+(4*i)]&&!arr[2+(4*i)]&&!arr[3+(4*i)]) cout <<"2 ";
		if(arr[0+(4*i)]&&!arr[1+(4*i)]&&!arr[2+(4*i)]&&!arr[3+(4*i)]) cout <<"1 ";
		if(!arr[0+(4*i)]&&!arr[1+(4*i)]&&!arr[2+(4*i)]&&!arr[3+(4*i)]) cout <<"0 ";
	}
	cout <<endl;
}
//octal
void oct(int arr[],int octa[]){
	int i=0;
	cout<<endl<<"<.....>"<<endl;
	cout<<"octal"<<endl;
	for (int i=4; i>-1; i--){
		if(arr[0+(3*i)]&&arr[1+(3*i)]&&arr[2+(3*i)]) cout <<"7";
		if(!arr[0+(3*i)]&&arr[1+(3*i)]&&arr[2+(3*i)]) cout <<"6";
		if(arr[0+(3*i)]&&!arr[1+(3*i)]&&arr[2+(3*i)]) cout <<"5";
		if(!arr[0+(3*i)]&&!arr[1+(3*i)]&&arr[2+(3*i)]) cout <<"4";
		if(arr[0+(3*i)]&&arr[1+(3*i)]&&!arr[2+(3*i)]) cout <<"3";
		if(!arr[0+(3*i)]&&arr[1+(3*i)]&&!arr[2+(3*i)]) cout <<"2";
		if(arr[0+(3*i)]&&!arr[1+(3*i)]&&!arr[2]+(3*i)) cout <<"1";
		if(!arr[0+(3*i)]&&!arr[1+(3*i)]&&!arr[2+(3*i)]) cout <<"0";
	}
	cout <<endl;
}
