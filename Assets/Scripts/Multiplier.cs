using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Multiplier : MonoBehaviour
{
    PoolManager poolManager;

    public static Multiplier instance;
    
    public List<GameObject> passedBalls;
    public bool isUsed;

    public int multipleOf;
    void Awake()
    {
        instance = this;
    }

    void Start()
    {
        poolManager = PoolManager.instance;
        passedBalls = new List<GameObject>();
        // print("PassedBallsList" + passedBalls);
    }
    
    
}
