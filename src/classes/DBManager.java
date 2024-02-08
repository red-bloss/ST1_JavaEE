package classes;

import java.util.ArrayList;

public class DBManager {
    private static ArrayList<Tasks> tasks = new ArrayList<>();
    private static Long id = 4L;

    static {
        tasks.add(new Tasks(1L, "task1", "task1 is important", "2024-03-06", true));
        tasks.add(new Tasks(2L, "task2", "task2 is important", "2024-03-07", false));
        tasks.add(new Tasks(3L, "task3", "task3 is homework", "2024-03-09", false));
    }

    public static void addTask(Tasks task){
        task.setId(id);
        task.setStatus(false);
        id++;
        tasks.add(task);
    }

    public static Tasks getTask(Long id){
        Tasks task = new Tasks();
        for (int i = 0; i < tasks.size(); i++) {
            if(id == tasks.get(i).getId()){
                task = tasks.get(i);
            }
        }
        return task;
    }

    public static ArrayList getAllTasks(){
        return tasks;
    }

    public static void deleteTask(Long id){
        for (Tasks task: tasks) {
            if(id == task.getId()){
                tasks.remove(task);
            }
            
        }
    }
}
