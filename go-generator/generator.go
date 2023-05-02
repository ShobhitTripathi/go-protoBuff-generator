package main

import (
	"fmt"
	"os/exec"
)

func main() {
	execute()
}

func execute() {

	DSTDIR := "protoc"
	SRCDIR := "proto/chat/v1"

	app := "protoc"
	args1 := "--go_out=" + DSTDIR
	args2 := "--go_opt=paths=source_relative"
	args3 := "--go-grpc_out=" + DSTDIR
	args4 := "--go-grpc_opt=require_unimplemented_servers=false"
	args5 := "--go-grpc_opt=paths=source_relative"
	args6 := SRCDIR + "/chat.proto"

	cmd := exec.Command(app, args1, args2, args3, args4, args5, args6)
	fmt.Println(cmd)
	out, err := cmd.Output()

	// if there is an error with our execution
	// handle it here
	if err != nil {
		fmt.Printf("%s", err)
	}
	// as the out variable defined above is of type []byte we need to convert
	// this to a string or else we will see garbage printed out in our console
	// this is how we convert it to a string
	fmt.Println("Command Successfully Executed")
	output := string(out[:])
	fmt.Println(output)

}
