from rbig.rbig import RBIGMI, RBIG
from typing import Dict, Optional
import time
import numpy as np
from src.models.utils import subset_indices


def get_rbig_model(
    X: np.ndarray,
    params: Optional[Dict] = None,
    subsample: Optional[int] = 100_000,
    random_state: int = 123,
) -> None:

    X = subset_indices(X, subsample, random_state)
    n_layers = 10000
    rotation_type = "PCA"
    random_state = 0
    zero_tolerance = 60
    pdf_extension = 10

    # Initialize RBIG class
    rbig_model = RBIG(
        n_layers=n_layers,
        rotation_type=rotation_type,
        random_state=random_state,
        pdf_extension=pdf_extension,
        zero_tolerance=zero_tolerance,
    )

    rbig_model.fit(X)

    return rbig_model
