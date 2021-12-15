using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BallSpawner : MonoBehaviour
{
    public static BallSpawner instance;
    
    PoolManager poolManager;

    public int ballCount;
    
    private Rigidbody rb;
    
    [HideInInspector]public GameObject ballObj;
    
    public List<GameObject> spawnedBalls;
    public List<string> passedGateTag = new List<string>();
    
    void Awake ()
    {
        instance = this;
    }
    
    void Start ()
    {
        poolManager = PoolManager.instance;   
    }
    
    void OnTriggerEnter (Collider other)
    {
        foreach (var VARIABLE in MultiplierTracker.instance.GateNumber)
        {
            if (passedGateTag == null)
            {
                return;
            }
            
            if (!passedGateTag.Contains(MultiplierTracker.instance.GateNumber[VARIABLE - 1].ToString()))
            {
                if (!this.CompareTag(MultiplierTracker.instance.GateNumber[VARIABLE - 1].ToString()))
                {
                    if (other.CompareTag(MultiplierTracker.instance.GateNumber[VARIABLE - 1].ToString()))
                    {
                        passedGateTag.Add((VARIABLE).ToString());
                        this.tag = (VARIABLE).ToString();
                        
                        GenerateBalls(1, this.tag);
                    }
                }
                else
                {
                    passedGateTag.Add((VARIABLE).ToString());
                }
            }
            else
            {
                print("already has " + VARIABLE );
            }
        }  
    }

    public void GenerateBalls (int num,string parentTag)
    {
        if (passedGateTag == null)
        {
            return;
        }
        
        for (int i = 0; i < num; i++)
        {
            ballObj = poolManager.SpawnFromPool();
            ballObj.SetActive(true);
            ballObj.transform.position = transform.position;

            spawnedBalls.Add(ballObj);
            //ballObj.tag = parentTag;
            spawnedBalls[i].tag = parentTag;
            
            if (!ballObj.GetComponent<BallSpawner>().passedGateTag.Contains(parentTag))
            {
                ballObj.GetComponent<BallSpawner>().passedGateTag.Add(parentTag);
            }
            
            ballObj.GetComponent<Rigidbody>().AddForce(this.transform.forward * 100f, ForceMode.Impulse);
           
            ballCount++;
        }
    }
}
