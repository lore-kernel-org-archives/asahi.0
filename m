Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76CF6FD6
	for <asahi@lists.linux.dev>; Thu,  3 Nov 2022 13:39:06 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id f5so5313423ejc.5
        for <asahi@lists.linux.dev>; Thu, 03 Nov 2022 06:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z10ie4YimZPTB5alKBTkQ5yy8IFqW2xEzKQg8IUrI5Q=;
        b=pgr5Gx3bBX3g/9j+1rndCGqX8oJwyStHDPVna9E2jr1olHBAOL65lY9sGZ6C0dHKRZ
         s1TGcsfld0juH7eqdNCaQV1RW/OlCIaRyeK1JRqNjRErKEkKLKDbxMCSaLVW1Svvc3s7
         cuFoP3jF06NJ2GcQEsqf8J5ZFmvPii8SNmm/f1dQnv2l1x2ZSDTPomqMw7v19lelSmgX
         xhF1hrXsEymIQ5xZxdJk6iH+lqrislUIHJxTtHZ0nmEkXQp+ao63XwV50SsZeIDizGie
         vXA+plFEoeXOspjFxWN7rJXbcM4+adZ14ONPJh+A0VDmSVPTnM9GF904xdWvCtGantsv
         ZkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z10ie4YimZPTB5alKBTkQ5yy8IFqW2xEzKQg8IUrI5Q=;
        b=6FSdGOKiEFGQ4RDVyXrTtoVXrOSy3HHJ/h2pKs0cqPa+osj0IdXv8HxxQqr36nA1zw
         VdTeRqhUXs5rEQUVHdQRJx2wxe+mASLt+KtCe+Ww7b/TFhrrUcmqXxuKHFqKG4fK61ad
         HRB8w2fPRCLgKmjBkxy6qCf7l/+ZywG4f+WlG46jZvnuEn6Ha/5olZK776GP+ymfI5cT
         fzYv0WRMO9iV7koR14wfMB+yBWIUexoqc5C4vqY5ALTrw5G8JQ6ANC4FeL+gVtxAx43t
         EeMP3DN2XCx6Gi2pp0hjNwRMfzViyAQ2FNdzG/0MTNUpzjmogwOh4fdbIcWFCT/aXTOi
         O1QQ==
X-Gm-Message-State: ACrzQf3vVKj/XYvaTN9uKLOGhdXf/kqg3UZbUu/41alayVHnOV3gRn18
	n+o3YETGXL/xGl635Zwqyd4=
X-Google-Smtp-Source: AMsMyM6UxqoEJfmd6WlvwItfcqSFLkxUnSH8wF8LywPjgOn86RkLU8h80fxh0vildnlRCzP/vfWbpg==
X-Received: by 2002:a17:907:80d:b0:73d:a576:dfbd with SMTP id wv13-20020a170907080d00b0073da576dfbdmr28805551ejb.402.1667482744700;
        Thu, 03 Nov 2022 06:39:04 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qp18-20020a170907207200b007ad86f86b4fsm517328ejb.69.2022.11.03.06.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:39:03 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	linux-tegra@vger.kernel.org,
	asahi@lists.linux.dev
Subject: [PATCH v10 0/5] iommu: Support mappings/reservations in reserved-memory regions
Date: Thu,  3 Nov 2022 14:38:55 +0100
Message-Id: <20221103133900.1473855-1-thierry.reding@gmail.com>
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

This version has several fixes over the previous v9, which can be found
here:

  https://lore.kernel.org/all/20220923123557.866972-1-thierry.reding@gmail.com/

Most notably this addresses an issue with DMA address translations
failing across bus boundaries with mismatching #address-cells (2 vs. 1)
properties. The proposed fix is to treat DMA parents as creating a DMA
bus that is separate from the control bus, and therefore stop address
translation for DMA at the last DMA parent.

Other than that this includes minor fixups to the DT bindings as well as
some rework to the OF/IOMMU core code to be more easily extensible in
the future.

I've also dropped the tegra-smmu patches for now since they have
accumulated some bitrot and probably need more revision and testing.

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
  of: Introduce of_translate_dma_region()
  of: Stop DMA translation at last DMA parent
  dt-bindings: reserved-memory: Document iommu-addresses
  iommu: Implement of_iommu_get_resv_regions()
  iommu: dma: Use of_iommu_get_resv_regions()

 .../reserved-memory/reserved-memory.yaml      | 73 ++++++++++++++
 drivers/iommu/dma-iommu.c                     |  3 +
 drivers/iommu/of_iommu.c                      | 94 +++++++++++++++++++
 drivers/of/address.c                          | 58 +++++++++++-
 include/linux/of_address.h                    |  2 +
 include/linux/of_iommu.h                      |  8 ++
 6 files changed, 235 insertions(+), 3 deletions(-)

-- 
2.38.1

