using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PoolManager : MonoBehaviour
{
    public static PoolManager instance;
    
    public List<GameObject> ballPool;
    public List<Rigidbody> ballRigidBodies;
    public GameObject prefab;
    public int poolSize = 50;


    void Awake ()
    {
        
        instance = this;
    }

    void Start ()
    {
        print("what the hell");

        ballPool = new List<GameObject>();
        ballRigidBodies = new List<Rigidbody>();

        GameObject obj;
        Rigidbody objRb;

        for (int i = 0; i < poolSize; i++)
        {
            obj = Instantiate(prefab);
            objRb = obj.GetComponent<Rigidbody>();
            obj.SetActive(false);
            ballPool.Add(obj);
            ballRigidBodies.Add(objRb);

        }
    }


    public GameObject SpawnFromPool ()
    {
        for (int i = 0; i < poolSize; i++)
        {
            if (!ballPool[i].activeInHierarchy)
            {
                return ballPool[i];
            }
        }
        return null;
    }

    
}
