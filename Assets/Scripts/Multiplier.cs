using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Multiplier : MonoBehaviour
{
    PoolManager poolManager;

    public List<GameObject> passedBalls;
    public bool isUsed;

    void Awake()
    {

    }
    
    void Start()
    {
        poolManager = PoolManager.instance;
        passedBalls = new List<GameObject>();
        // print("PassedBallsList" + passedBalls);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void OnTriggerEnter (Collider other)
    {
        if (isUsed)
        {
            return;
        }
        else if (other.CompareTag("Ball"))
        {
            BallSpawner.instance.GenerateBalls(5);
            CheckForDuplicates();

            other.tag = "Used";
            //isUsed = true;
        }
    }

    public void CheckForDuplicates()
    {
        if (passedBalls == null)
        {
            return;
        }
        for (int i = 0; i < 15; i++)
        {
            if (!passedBalls.Contains(BallSpawner.instance.spawnedBalls[i]))
            {
                print("Entered the loop");
                passedBalls.Add(BallSpawner.instance.spawnedBalls[i]);
            }
        }
    }
}
