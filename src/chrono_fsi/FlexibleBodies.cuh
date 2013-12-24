///////////////////////////////////////////////////////////////////////////////
//	collideSphereSphere.cu
//	Does the required calculations for SPH, both fluid and rigid bodies
//
//	Related Files: collideSphereSphere.cuh, SDKCollisionSystem.cu, SDKCollisionSystem.cu
//	Input File:		-
/////////////////////////////////////////////////////////////////////////////////
//	Created by Arman Pazouki, apazouki@gmail.com
//	Copyright 2013 Arman Pazouki
//
//	This file is part of SPH_FSI.
//
//	SPH_FSI is free software: you can redistribute it and/or modify
//	it under the terms of the GNU General Public License as published by
//	the Free Software Foundation, either version 3 of the License, or
//	any later version.
//
//	SPH_FSI is distributed in the hope that it will be useful,
//	but WITHOUT ANY WARRANTY; without even the implied warranty of
//	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//	GNU General Public License for more details.
//
//	You should have received a copy of the GNU General Public License
//	along with SPH_FSI.  If not, see <http://www.gnu.org/licenses/>.
///////////////////////////////////////////////////////////////////////////////

#ifndef FLEXIBLEBODIES_CUH
#define FLEXIBLEBODIES_CUH

#include <thrust/device_vector.h>

struct ANCF_Params {
	real_ r;
	real_ E;
	real_ I;
	real_ rho;
	real_ A;
	int ne; // number of elements per noodle
};

__device__ __host__ inline void shape_fun(real_* S, real_ x, real_ lE)
{
	real_ xi = x/lE;

	S[0] = 1 - 3*xi*xi + 2*xi*xi*xi;
	S[1] = lE * (xi - 2*xi*xi + xi*xi*xi);
	S[2] = 3*xi*xi - 2*xi*xi*xi;
	S[3] = lE * (-xi*xi + xi*xi*xi);
}

__device__ __host__ inline void shape_fun_d(real_* Sx, real_ x, real_ lE)
{
	real_ xi = x/lE;

	Sx[0] = (6*xi*xi-6*xi)/lE;
	Sx[1] = 1-4*xi+3*xi*xi;
	Sx[2] = -(6*xi*xi-6*xi)/lE;
	Sx[3] = -2*xi+3*xi*xi;
}

void Update_ANCF_Beam(
		thrust::device_vector<real3> & ANCF_NodesD,
		thrust::device_vector<real3> & ANCF_SlopesD,
		thrust::device_vector<real3> & ANCF_NodesVelD,
		thrust::device_vector<real3> & ANCF_SlopesVelD,
		const thrust::device_vector<real3> & flex_FSI_NodesForces1,
		const thrust::device_vector<real3> & flex_FSI_NodesForces2,
		const thrust::device_vector<int2> & ANCF_ReferenceArrayNodesOnBeamsD,
		const thrust::device_vector<real_> & ANCF_Beam_LengthD,
		const thrust::host_vector<bool> & ANCF_IsCantilever,
		const int numFlexBodies,
		const ANCF_Params & flexParams,
		real_ dT
		);

#endif
