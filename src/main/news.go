package main

import (
	"database/sql"
	"fmt"
	"net/http"
    "encoding/json"
	_ "github.com/go-sql-driver/mysql"
)

type fieldnews struct {
	ID     int
	Author string
	Body   string
	Created string
}

func connect() (*sql.DB, error) {

	fmt.Println("Connecting to database...")
	var user = "root"
	var password = ""
	var host = "127.0.0.1"
	var port = "3306"
	var database = "kumparan"

	connString := "" + user + ":" + password + "@tcp(" + host + ":" + port + ")/" + database + ""

	db, err := sql.Open("mysql", connString)
	if err != nil {
		return nil, err
	}

	return db, nil

}

func getNews(w http.ResponseWriter, r *http.Request) {

	w.Header().Set("Content-Type", "application/json")
	 var result []byte
    var err error
	db, err := connect()
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer db.Close()

   

	if r.Method == "GET" {
        

		rows, err := db.Query("select id, author, body,created from news order by `created` DESC LIMIT 10 ")
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		defer rows.Close()

		var data []fieldnews

		for rows.Next() {
			var each = fieldnews{}
			var err = rows.Scan(&each.ID, &each.Author, &each.Body, &each.Created)

			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}

			data = append(data, each)

		}

		if err = rows.Err(); err != nil {
       	 	http.Error(w, err.Error(), http.StatusInternalServerError)
			return
        }

                result, err = json.Marshal(data)

                if err != nil {
                    http.Error(w, err.Error(), http.StatusInternalServerError)
                    return
                }

                w.Write(result)
                return

                
    //end get
	}else if r.Method == "POST"{
        
        var reqauthor = r.FormValue("author") 
        var reqbody = r.FormValue("body") 

        insert, err := db.Query("INSERT INTO news (author, body)  VALUES ( '"+ reqauthor +"', '"+ reqbody +"' )")

	    if err != nil {
             http.Error(w, err.Error(), http.StatusInternalServerError)
             return
        }
	  
	     defer insert.Close()
        //fmt.Println(reqauthor)

	} 

	http.Error(w, "", http.StatusBadRequest)
}

func main() {
	http.HandleFunc("/news", getNews)

	fmt.Println("starting web server at http://localhost:8080/")
	http.ListenAndServe(":8080", nil)
}
