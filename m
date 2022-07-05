Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805F52F56
	for <asahi@lists.linux.dev>; Tue,  5 Jul 2022 13:06:57 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id lg18so1731229ejb.0
        for <asahi@lists.linux.dev>; Tue, 05 Jul 2022 06:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E5lZCn36K7elVbgWUPtU4nIkD2xVpncEAsbxyPDLzyQ=;
        b=lm8H8F5nhMgMkfJktmNYWnUwAHoU2kzLD1lTjvkXjHVFIckKFJIfzndHBmtswfGRg/
         MXRKwWqk9GdDKkkUqoELU2G0JpTQkS+85q5nInih4KHrdwlCb32ArHDlZxJXLb14yZ2w
         +l97eRTC0Rv6D+/OJhsjiyFiepR7ozNkzifW+JtqVkW88Hmw1G+yqTqvB+NTaPXM9WNH
         edYyvQDB+kYK94PH8/ZDymKjKKoIAPrxwfLE5D+AGN3jfz0NNxFdNDR7eibxSRGx574F
         7II+SvPVgYI9g9ZmxZYYaN8b0zAdF+EOcBR05XoLHJcl8DPdXwsm9HsEhM3ikdSOVCIO
         JIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E5lZCn36K7elVbgWUPtU4nIkD2xVpncEAsbxyPDLzyQ=;
        b=BA2OUS2ABU1aJi/m4o9XpiN4iuasdTUreaLVchlKZG3qnl9tkHiFZPrA62wWvkGA00
         ozqRH4sjvvoyJiOPADofPcvqc3CMhcF6qIxc73tTL9OW6lkDbDYSiKnDbg/oiLve3WT3
         MMtnJXuWKiQjsHTLd7A8zFMITO0+umcyEWWhJHt9EzhpDPB+rhl4j9pakBHtutgSrqJB
         g/BzCO0zynhe8sdoRXqy2wXFHaEVlcNp/XmssziE4lnhCAuuj+AHVSDypzePfFpSo4O4
         +/ih+EHXh0d67vg4mFyEcr/lb6+hrE/4PhzOj11rJ27Ub9qM4At0XRgD0GNr6+HFweuo
         dNNw==
X-Gm-Message-State: AJIora8XGEaKpaEVeEmifKqfDkUis/KmFEcWVaT64eEqagDGZgTowJGG
	hHa8ioShxQFpqo1OoU+lLx8=
X-Google-Smtp-Source: AGRyM1vD8mMwCrBI8neyCmTlP1RSBwb6Rp+y6x2OGJiIuDCQ/Ljz4kwRfPcQ5Ky4BFx6E/eSBIIMrw==
X-Received: by 2002:a17:907:1dc6:b0:72a:5e9a:91be with SMTP id og6-20020a1709071dc600b0072a5e9a91bemr28945775ejc.730.1657026415675;
        Tue, 05 Jul 2022 06:06:55 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d8-20020a056402000800b0043a71c376a2sm2744485edu.33.2022.07.05.06.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 06:06:53 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Janne Grunau <j@jannau.net>,
	Sameer Pujar <spujar@nvidia.com>,
	devicetree@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	linux-tegra@vger.kernel.org,
	asahi@lists.linux.dev
Subject: [PATCH v7] dt-bindings: reserved-memory: Document iommu-addresses
Date: Tue,  5 Jul 2022 15:06:52 +0200
Message-Id: <20220705130652.433496-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705125834.431711-2-thierry.reding@gmail.com>
References: <20220705125834.431711-2-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This adds the "iommu-addresses" property to reserved-memory nodes, which
allow describing the interaction of memory regions with IOMMUs. Two use-
cases are supported:

  1. Static mappings can be described by pairing the "iommu-addresses"
     property with a "reg" property. This is mostly useful for adopting
     firmware-allocated buffers via identity mappings. One common use-
     case where this is required is if early firmware or bootloaders
     have set up a bootsplash framebuffer that a display controller is
     actively scanning out from during the operating system boot
     process.

  2. If an "iommu-addresses" property exists without a "reg" property,
     the reserved-memory node describes an IOVA reservation. Such memory
     regions are excluded from the IOVA space available to operating
     system drivers and can be used for regions that must not be used to
     map arbitrary buffers.

Each mapping or reservation is tied to a specific device via a phandle
to the device's device tree node. This allows a reserved-memory region
to be reused across multiple devices.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v7:
- keep reserved-memory.txt to avoid broken references

Changes in v6:
- add device phandle to iommu-addresses property in examples
- remove now unused dt-bindings/reserved-memory.h header
---
 .../reserved-memory/reserved-memory.yaml      | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
index 7a0744052ff6..8b885ee82ff4 100644
--- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
+++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
@@ -52,6 +52,30 @@ properties:
       Address and Length pairs. Specifies regions of memory that are
       acceptable to allocate from.
 
+  iommu-addresses:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: >
+      A list of phandle and specifier pairs that describe static IO virtual
+      address space mappings and carveouts associated with a given reserved
+      memory region. The phandle in the first cell refers to the device for
+      which the mapping or carveout is to be created.
+
+      The specifier consists of an address/size pair and denotes the IO
+      virtual address range of the region for the given device. The exact
+      format depends on the values of the "#address-cells" and "#size-cells"
+      properties of the device referenced via the phandle.
+
+      When used in combination with a "reg" property, an IOVA mapping is to
+      be established for this memory region. One example where this can be
+      useful is to create an identity mapping for physical memory that the
+      firmware has configured some hardware to access (such as a bootsplash
+      framebuffer).
+
+      If no "reg" property is specified, the "iommu-addresses" property
+      defines carveout regions in the IOVA space for the given device. This
+      can be useful if a certain memory region should not be mapped through
+      the IOMMU.
+
   no-map:
     type: boolean
     description: >
@@ -97,4 +121,42 @@ oneOf:
 
 additionalProperties: true
 
+examples:
+  - |
+    / {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      reserved-memory {
+        ranges;
+
+        adsp_resv: reservation-adsp {
+          /*
+           * Restrict IOVA mappings for ADSP buffers to the 512 MiB region
+           * from 0x40000000 - 0x5fffffff. Anything outside is reserved by
+           * the ADSP for I/O memory and private memory allocations.
+           */
+          iommu-addresses = <&adsp 0x0 0x00000000 0x00 0x40000000>,
+                            <&adsp 0x0 0x60000000 0xff 0xa0000000>;
+        };
+
+        fb: framebuffer@90000000 {
+          reg = <0x0 0x90000000 0x0 0x00800000>;
+          iommu-addresses = <&dc0 0x0 0x90000000 0x0 0x00800000>;
+        };
+      };
+
+      bus@0 {
+        adsp: adsp@2990000 {
+          reg = <0x0 0x2990000 0x0 0x2000>;
+          memory-region = <&adsp_resv>;
+        };
+
+        dc0: display@15200000 {
+          reg = <0x0 0x15200000 0x0 0x10000>;
+          memory-region = <&fb>;
+        };
+      };
+    };
+
 ...
-- 
2.36.1

