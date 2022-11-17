Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556E48BFF
	for <asahi@lists.linux.dev>; Thu, 17 Nov 2022 18:54:31 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id v17so3898165edc.8
        for <asahi@lists.linux.dev>; Thu, 17 Nov 2022 10:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lO8iu4sFpajmaNtnRDMO3L66IGHotZL//2Yoi5MNZGw=;
        b=jfmp3Gx/GKTarItOmR+s898YqSa1TWnozjilCF3nyBAeTxiV3LH8iKBFzoYON0T0f2
         yiTAa6XvKyptXOVm/UEwSbutWzcCxS5zv3Q6LlYljGhGMG0x0LwbnM6DjbZxdhupoAr8
         GrLvAQeAfkSLFp4OaULC8rF9XY2MRPYDWqnIEzvwQPsxMpu+P/nmjLSjAi2Ram2LKRxa
         VhbO6e6kxdjgKNCjUcl85RmGdhyJJzgHbR+mvUZGPSvez/nXnFDFLJrcgLcLCYv+RT8X
         EddTXBYTWfhXXUpXn37Jdz5A7CYAqSwwlfFtEiMQnKODHk4+R9swGYXrBBn/xr8yUEWu
         quLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lO8iu4sFpajmaNtnRDMO3L66IGHotZL//2Yoi5MNZGw=;
        b=PlO8Agg/5qrKhWtpexWVARDOaxc4brr8/13kHkSP5W/VXhvsX8Idh86Rlk0xLe8oF6
         Omx6SjhAZZZQGMtLwrk5O+lvLDbkc/+D0tr4Ik4bR2rgUFDu9caaDOrVC15/c9UT9meX
         4FnWtkVrZklTiooGpWInVlVBl3pOxB+mD2ZC6cFhoczmfZt9ham8r99dOoVitGQrG40X
         TTInqHaxVmZ76Tvol7cRLT2dDMpIGEJ1kjwOCmjg3Uc4XmDTTOFNbC6Nb4r0p3EBPXrw
         MnzvzbCmgvI/jpE73qY9QST6GialkVoM/oUhezMC4Pca2srZDxgXEKdUWkQbzIyJRdeY
         27wA==
X-Gm-Message-State: ANoB5pkpnOSfIZ/IrJvZvExzVDZQoBQ/VaubGlv5M0/FC3jqGMbrln+w
	bYZBR/yQMUl36QoPBpqB62V2whUF+lI=
X-Google-Smtp-Source: AA0mqf7Kl6CgbcMgxqNwKtSmiN6Aj7E6wbC+SmSy5fRDZHYki3xdJx3CDIjnXq3RzE3SsmF8i8hk1w==
X-Received: by 2002:a05:6402:389:b0:459:2515:b27b with SMTP id o9-20020a056402038900b004592515b27bmr3351323edv.338.1668711269495;
        Thu, 17 Nov 2022 10:54:29 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n22-20020aa7c696000000b00457c85bd890sm874261edq.55.2022.11.17.10.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:54:28 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Janne Grunau <j@jannau.net>,
	Sameer Pujar <spujar@nvidia.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	devicetree@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	linux-tegra@vger.kernel.org,
	asahi@lists.linux.dev
Subject: [PATCH v12 0/4] iommu: Support mappings/reservations in reserved-memory regions
Date: Thu, 17 Nov 2022 19:54:20 +0100
Message-Id: <20221117185424.2359687-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Hi,

This version is a minor update to the previous v11, which can be found
here:

  https://lore.kernel.org/all/20221111161806.630527-1-thierry.reding@gmail.com/

The only change here is that the #dma-{address,size}-cells is dropped.
It turns out to be much simpler to just update #{address,size}-cells to
what they should be rather than add extra complexity for the DMA work-
around. There's a minor update to the DT binding so that it can now
properly validate cases where we have both reg and iommu-addresses
properties.

An example is included in the DT bindings, but here is an extract of
what I've used to test this:

        reserved-memory {
                #address-cells = <2>;
                #size-cells = <2>;
                ranges;

                /*
                 * Creates an identity mapping for the framebuffer that
                 * the firmware has setup to scan out a bootsplash from.
                 */
                fb: framebuffer@92cb2000 {
                        reg = <0x0 0x92cb2000 0x0 0x00800000>;
                        iommu-addresses = <&dc0 0x0 0x92cb2000 0x0 0x00800000>;
                };

                /*
                 * Creates a reservation in the IOVA space to prevent
                 * any buffers from being mapped to that region. Note
                 * that on Tegra the range is actually quite different
                 * from this, but it would conflict with the display
                 * driver that I tested this against, so this is just
                 * a dummy region for testing.
                 */
                adsp: reservation-adsp {
                        iommu-addresses = <&dc0 0x0 0x90000000 0x0 0x00010000>;
                };
        };

        host1x@50000000 {
                dc@54200000 {
                        memory-region = <&fb>, <&adsp>;
                };
        };

This is abbreviated a little to focus on the essentials. Note also that
the ADSP reservation is not actually used on this device and the driver
for this doesn't exist yet, but I wanted to include this variant for
testing, because we'll want to use these bindings for the reservation
use-case as well at some point.

I've also been able to make use of this binding and the IOMMU code in
conjunction with the simple-framebuffer driver to hand over a display
configuration set up by UEFI to the Linux kernel.

Janne has confirmed[0] this to be suitable for indirect mappings as
well, though these patches don't implement that feature yet. Potential
extensions to this have been discussed but are not yet included at this
time to not further complicate things.

Thierry

[0]: https://lore.kernel.org/all/20220909144504.GA4024@jannau.net/

Thierry Reding (4):
  of: Introduce of_translate_dma_region()
  dt-bindings: reserved-memory: Document iommu-addresses
  iommu: Implement of_iommu_get_resv_regions()
  iommu: dma: Use of_iommu_get_resv_regions()

 .../reserved-memory/reserved-memory.yaml      | 89 +++++++++++++++++-
 drivers/iommu/dma-iommu.c                     |  3 +
 drivers/iommu/of_iommu.c                      | 94 +++++++++++++++++++
 drivers/of/address.c                          | 41 ++++++++
 include/linux/of_address.h                    |  2 +
 include/linux/of_iommu.h                      |  8 ++
 6 files changed, 233 insertions(+), 4 deletions(-)

-- 
2.38.1

