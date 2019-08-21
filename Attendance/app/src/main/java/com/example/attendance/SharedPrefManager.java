package com.example.attendance;

import android.content.Context;
import android.content.SharedPreferences;


public class SharedPrefManager {
    private static SharedPrefManager instance;
    private static Context ctx;

    private static final String SHARED_PREF_NAME = "mysharedpref12";
    private static final String KEY_USERNAME = "UserName";
    private static final String KEY_USER_EMAIL = "UserEmail";
    private static final String KEY_USER_ID = "userid";

    private SharedPrefManager(Context context) {
        ctx = context;

    }

    public static synchronized SharedPrefManager getInstance(Context context) {
        if (instance == null) {
            instance = new SharedPrefManager(context);
        }
        return instance;
    }
    public boolean userLogin(int Lect_ID, String UserName, String Email){
        SharedPreferences sharedPreferences = ctx.getSharedPreferences(SHARED_PREF_NAME, Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPreferences.edit();

        editor.putInt(KEY_USER_ID, Lect_ID);
        editor.putString(KEY_USER_EMAIL, Email);
        editor.putString(KEY_USERNAME, UserName);

        editor.apply();

        return true;
    }
    //check whether the user is logged in or not
    public boolean isLoggenIn(){
        SharedPreferences sharedPreferences = ctx.getSharedPreferences(SHARED_PREF_NAME, Context.MODE_PRIVATE);
        if (sharedPreferences.getString(KEY_USERNAME, null) !=null){
            return true;
        }
        return false;
    }
    public boolean logout(){
        SharedPreferences sharedPreferences = ctx.getSharedPreferences(SHARED_PREF_NAME, Context.MODE_PRIVATE);
        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.clear();
        editor.apply();
        return true;
    }


}


