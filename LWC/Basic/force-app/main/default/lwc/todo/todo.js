import { LightningElement, track, wire } from 'lwc';
import getTasks from '@salesforce/apex/TodoListController.getTasks';
import { refreshApex } from '@salesforce/apex';
import insertTask from '@salesforce/apex/TodoListController.insertTask';
import deleteTask from '@salesforce/apex/TodoListController.deleteTask';

export default class Todo extends LightningElement {

  
  @track
  todos = [];
  newTask = "";
  todosResponse;
  loading = true;

  updateNewTask(event){
    this.newTask = event.target.value;
  }

  //This code is used with list(memory) 
  addTask(event){
    if(this.newTask == ''){
      return;
    }
    this.loading = true;
    insertTask({subject: this.newTask})
    .then(result => {
      console.log(result);
      this.todos.push({
        id: this.todos[this.todos.length - 1] ? this.todos[this.todos.length - 1].id + 1 : 0,
        name: this.newTask,
        recordId: result.Id
      });
      this.newTask = '';
    })
    .catch(error => console.log(error))
    .finally(() => this.loading = false);

    
  }

  //This code is used with apex wire todos property
  //   addTask(event){
  //   this.todos.unshift({
  //     Id: this.todos.data.length + 1,
  //     Subject: this.newTask
  //   });
  //     this.newTask = '';
  // }

  deleteTask(event){
    let idToDelete = event.target.name;
    let todos = this.todos; 
    let todoIndex;
    let recordIdToDelete;

    this.loading = true;
    // Method 1
    for(let i=0; i<todos.length; i++){
      if(idToDelete === todos[i].id){
        todoIndex = i;
      } 
    }

    recordIdToDelete = todos[todoIndex].recordId;
    console.log(recordIdToDelete);
     
    deleteTask({recordId: recordIdToDelete})
    .then(result => {
      if(result){
        console.log(result);
        todos.splice(todoIndex, 1);
      }
      else{
        console.log('Unable to delete');
      }
      
    })
    .catch(error => console.log(error))
    .finally(()=> this.loading = false);

    

    // Method 2
    // todos.splice(
    //   todos.findIndex(function(todo){
    //     return todo === idToDelete;
    //   }), 1
    // );
    
    // Method 3
    // todos.splice(todos.findIndex(todo => todo === idToDelete), 1);

   }

   @wire(getTasks)
   getTodoTasks(response){
     this.todosResponse = response;
     let data = response.data;
     let error = response.error;
      if(data || error){
        this.loading = false;
      }
     if(data){
       console.log(data);
       this.todos = [];
       data.forEach(task => {
         this.todos.push({
          id: this.todos.length + 1,
          name: task.Subject,
          recordId: task.Id
         });
       });

     } else if(error){
        console.log(error);
     }

   }

   refreshTodoList(){
     this.loading = true;
     refreshApex(this.todosResponse)
     .finally(()=> this.loading = false);
   }

}