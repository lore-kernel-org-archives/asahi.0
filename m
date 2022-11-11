Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D0C24F35
	for <asahi@lists.linux.dev>; Fri, 11 Nov 2022 16:18:12 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w14so7059793wru.8
        for <asahi@lists.linux.dev>; Fri, 11 Nov 2022 08:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ekBaJphyqfmOYkytyrR3z1wogeXER5E+SCF5H0rXjtI=;
        b=TbEzvWNDq7YvXvBvGpFQPOG7x8z9bpqnVDb5936JHGIWYmtbx8AdbCwbHKlaqAylpy
         RbQAqXNASJE2JT76nlngJsXZIzOQy8rjttLJXVfcAlU6EbdpKYF7aVucyVu1EUS610EX
         Qm9G7Lo7576Uzn9zRJ3gDXqTRZnHaDiWbCC57HvlJxnnwasjfZgGXl4QY6RDyeh6lDDm
         odN79gkC1XexHDnWCT059yCqgHsnD8o003HlgezN2cXARbGXbeHjiMLUcrVoIYLSPXPj
         yAT/bG3KcW829rKbJrLkA3O9Idgpji055MPijDF/lc3cMLseXE48JkNrn2ao/nbHUebi
         xk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekBaJphyqfmOYkytyrR3z1wogeXER5E+SCF5H0rXjtI=;
        b=SMamLAn76Z8fGkhknLSa+0DKdoSIWXe/f6vVO31N/jLr6RM5JSdCMa6fLGGchrcDPz
         vdYFaQluT4tBlmipQgHCDOq24lVGfYCODXTVswmEVbhN/lDPkYDEYZMYwdEH/LdNp0W3
         CrX7cnO0D50i7wi/XcqJ3yjqiBoLi0xKyDybChsDyiU69sPjiDVkVgNgSU8kVCPY7LpV
         U1Ac+lADD78HUa1/VINqsodUgDroEcS6IXPi/9+TQ4gfeQCQX49fRDROMFSCVfggi8Ip
         YVICHrA0CVnfAuhHOVOF/LxFGIW8wAZeZl5BkJCs4l8G7NsIq8Ngx7/l0HUBAxIsuLzP
         3ZAg==
X-Gm-Message-State: ANoB5plzzusXI8AJdJCB4PXbzynvdm6sIhaF12ZAVGmXoY+yIsU4yCXP
	U6tKj0P83POMvRxO4fdKvSs=
X-Google-Smtp-Source: AA0mqf4MFQD8mRau9KVl7w6CUOifOCeWfzO7+r7u17yFoZi3DwpKM5KMzzdzYXXu8hWApMpLxrzkwQ==
X-Received: by 2002:a5d:458c:0:b0:236:7005:7e4f with SMTP id p12-20020a5d458c000000b0023670057e4fmr1810831wrq.337.1668183491250;
        Fri, 11 Nov 2022 08:18:11 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f20-20020a05600c155400b003c6f3e5ba42sm10971340wmg.46.2022.11.11.08.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 08:18:10 -0800 (PST)
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
Subject: [PATCH v11 0/5] iommu: Support mappings/reservations in reserved-memory regions
Date: Fri, 11 Nov 2022 17:18:01 +0100
Message-Id: <20221111161806.630527-1-thierry.reding@gmail.com>
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

This version has several fixes over the previous v10, which can be found
here:

  https://lore.kernel.org/all/20221103133900.1473855-1-thierry.reding@gmail.com/

Most notably this introduces a better mechanism to deal with DMA address
translation issues caused by a mismatch of #address-cells in child and
DMA parent nodes. This now introduces #dma-address-cells and #dma-size-
cells, which can be used to override #address-cells and #size-cells and
define a DMA bus that can be wider than the control bus.

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



Thierry Reding (5):
  of: Introduce support for #dma-{address,size}-cells
  of: Introduce of_translate_dma_region()
  dt-bindings: reserved-memory: Document iommu-addresses
  iommu: Implement of_iommu_get_resv_regions()
  iommu: dma: Use of_iommu_get_resv_regions()

 .../reserved-memory/reserved-memory.yaml      | 73 ++++++++++++++
 drivers/iommu/dma-iommu.c                     |  3 +
 drivers/iommu/of_iommu.c                      | 94 +++++++++++++++++++
 drivers/of/address.c                          | 84 +++++++++++++----
 drivers/of/base.c                             | 70 +++++++++++---
 drivers/of/of_private.h                       | 14 ++-
 include/linux/of.h                            | 17 +++-
 include/linux/of_address.h                    |  4 +-
 include/linux/of_iommu.h                      |  8 ++
 9 files changed, 329 insertions(+), 38 deletions(-)

-- 
2.38.1

