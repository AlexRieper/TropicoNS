/**
 * Copyright 1998-2011 Epic Games, Inc. All Rights Reserved.
 */
class InstancedFoliageActor extends Actor
	native(Foliage)
	hidecategories(Object);

var	const native transient Map_Mirror FoliageMeshes{TMap<class UStaticMesh*, struct FFoliageMeshInfo>};

cpptext
{
	// UObject interface
	virtual void Serialize(FArchive& Ar);
	virtual void BeginDestroy();
	virtual void PostLoad();

	// AActor interface
	virtual void UpdateComponentsInternal(UBOOL bCollisionUpdate = FALSE);
	virtual void ClearComponents();
	virtual void PostEditUndo();

	// AInstancedFoliageActor interface
	void AddInstance( class UStaticMesh* InMesh, const FFoliageInstance& InNewInstance );
	void RemoveInstances( class UStaticMesh* InMesh, TArray<INT>& Instances );
	void GetInstancesInsideSphere( class UStaticMesh* InMesh, const FSphere& Sphere, TArray<INT>& OutInstances );
	void SnapInstancesForLandscape( const TSet<class ULandscapeHeightfieldCollisionComponent*>& InComponents, const FBox& InBox );

	// Get the instanced foliage actor for the current streaming level.
	static AInstancedFoliageActor* GetInstancedFoliageActor(UBOOL bCreateIfNone=TRUE);
}

defaultproperties
{
	bStatic=true
}