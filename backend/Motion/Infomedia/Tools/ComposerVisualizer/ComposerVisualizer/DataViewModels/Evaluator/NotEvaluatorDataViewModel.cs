﻿// --------------------------------------------------------------------------------------------------------------------
// <copyright file="NotEvaluatorDataViewModel.cs" company="Gorba AG">
//   Copyright © 2011-2015 Gorba AG. All rights reserved.
// </copyright>
// --------------------------------------------------------------------------------------------------------------------

namespace Gorba.Motion.Infomedia.Tools.ComposerVisualizer.DataViewModels.Evaluator
{
    using System.ComponentModel;

    using Gorba.Motion.Infomedia.Tools.ComposerVisualizer.DataViewModels.Eval;

    using Xceed.Wpf.Toolkit.PropertyGrid.Attributes;

    /// <summary>
    /// Not evaluator data view model
    /// </summary>
    [DisplayName(@"Not Evaluator")]
    public class NotEvaluatorDataViewModel : ContainerEvaluatorBaseDataViewModel
    {
        /// <summary>
        /// Gets or sets the string compare evaluation.
        /// </summary>
        [ExpandableObject]
        [ReadOnly(true)]
        public NotEvalDataViewModel Not { get; set; }
    }
}
