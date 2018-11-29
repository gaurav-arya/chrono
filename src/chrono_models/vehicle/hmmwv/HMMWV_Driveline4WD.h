// =============================================================================
// PROJECT CHRONO - http://projectchrono.org
//
// Copyright (c) 2014 projectchrono.org
// All rights reserved.
//
// Use of this source code is governed by a BSD-style license that can be found
// in the LICENSE file at the top level of the distribution and at
// http://projectchrono.org/license-chrono.txt.
//
// =============================================================================
// Authors: Radu Serban
// =============================================================================
//
// HMMWV 4WD driveline model based on ChShaft objects.
//
// =============================================================================

#ifndef HMMWV_DRIVELINE_4WD_H
#define HMMWV_DRIVELINE_4WD_H

#include "chrono_vehicle/wheeled_vehicle/driveline/ChShaftsDriveline4WD.h"

#include "chrono_models/ChApiModels.h"

namespace chrono {
namespace vehicle {
namespace hmmwv {

/// @addtogroup vehicle_models_hmmwv
/// @{

/// Shafts-based 4-WD driveline for the HMMWV vehicle.
class CH_MODELS_API HMMWV_Driveline4WD : public ChShaftsDriveline4WD {
  public:
    HMMWV_Driveline4WD(const std::string& name);
    ~HMMWV_Driveline4WD() {}

    virtual double GetCentralDifferentialBoxInertia() const override { return m_central_differentialbox_inertia; }
    virtual double GetFrontDifferentialBoxInertia() const override { return m_front_differentialbox_inertia; }
    virtual double GetRearDifferentialBoxInertia() const override { return m_rear_differentialbox_inertia; }
    virtual double GetDriveshaftInertia() const override { return m_driveshaft_inertia; }
    virtual double GetToFrontDiffShaftInertia() const override { return m_frontshaft_inertia; }
    virtual double GetToRearDiffShaftInertia() const override { return m_rearshaft_inertia; }

    virtual double GetCentralDifferentialRatio() const override { return m_central_differential_ratio; }
    virtual double GetFrontDifferentialRatio() const override { return m_front_differential_ratio; }
    virtual double GetRearDifferentialRatio() const override { return m_rear_differential_ratio; }
    virtual double GetFrontConicalGearRatio() const override { return m_front_conicalgear_ratio; }
    virtual double GetRearConicalGearRatio() const override { return m_rear_conicalgear_ratio; }

    virtual double GetDifferentialLockingLimit() const override { return m_differential_locking_limit; }

  private:
    // Shaft inertias.
    static const double m_central_differentialbox_inertia;
    static const double m_front_differentialbox_inertia;
    static const double m_rear_differentialbox_inertia;
    static const double m_driveshaft_inertia;
    static const double m_frontshaft_inertia;
    static const double m_rearshaft_inertia;

    // Gear ratios.
    static const double m_central_differential_ratio;
    static const double m_front_differential_ratio;
    static const double m_rear_differential_ratio;
    static const double m_front_conicalgear_ratio;
    static const double m_rear_conicalgear_ratio;

    // Differential locking torque limit.
    static const double m_differential_locking_limit;
};

/// @} vehicle_models_hmmwv

}  // end namespace hmmwv
}  // end namespace vehicle
}  // end namespace chrono

#endif
