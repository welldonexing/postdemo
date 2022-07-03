#include "httplib.h"
#include <iostream>
#include <fstream>
using namespace std;

int main(){
// HTTP
httplib::Client cli("http://127.0.0.1:8081");
constexpr auto path = "upload.jpg";
std::ifstream input(path , std::ios::binary);
std::stringstream buffer;
buffer << input.rdbuf(); 
httplib::MultipartFormDataItems items{
	{"image_file" ,buffer.str(),"image_file","file"}
};
auto res = cli.Post("/post",items);

res->body;
cout <<" status "<< res->status << std::endl;
cout <<" bode "<< res->body << std::endl;



}

