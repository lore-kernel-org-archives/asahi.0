Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260C033FB
	for <asahi@lists.linux.dev>; Fri, 20 Jan 2023 17:42:55 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id y11so7558449edd.6
        for <asahi@lists.linux.dev>; Fri, 20 Jan 2023 09:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMyox5X+o1PWplW+UtK2/1QC8S9KNu/U/kb3oGtD7g8=;
        b=nvlbgc80GaKuyTm8A7NhFE4OqAHZcv6SJuuov5jlTZRJFA1vhw/DtCo9Jq0YHj6/d1
         58CVcyCVH4RqztYW2DycVnCBXPEQG+uUalz5pRcTADl9CnJch/bkVEKCWx/WtzQSsLTy
         oilMwhY2j4upHrsxQ5f9AZoFRcxc5gTr1NKK2AP7kt6GllWgroBS5RpclrJyBJx9Upwa
         6MBcFOMuVDNICHVqJFnLiDgiD3XgfO5vr7OALYuFyNxOgAlAj6C381dndzoOdm5LCbLz
         fBlLnOrsFPgOWWa03Rm7bNDTIvrS/L50mOChSRoI/t1b5d9bXqszwzgjaPiNt6+EuxoK
         hY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMyox5X+o1PWplW+UtK2/1QC8S9KNu/U/kb3oGtD7g8=;
        b=zQVVbX7SNNk8j7qQWOqys4DcaZOkBPMFWmSTPFkj2qyyjDvOtGwn4D09+CFa0vnwOa
         z0y2vCJA0AOrNb3OnjLjq9EemFjAL1BZmHbA92XYxz8cwIrShr/aloJSDGDYDxSYPnYY
         8vQiUNWOnuygdqC5IdmFk0ZUu3kOoTJAc+/77qrVVhdnxnwf1mFzPo2c7QAdZ6grQpNo
         d+soFwHeN+cdctXO0CLLDr4Gd96pfAuD9o5sVU0ADxvbNerehElFJlLM/vf6kwuDZ1Mi
         1Ck0Pd7PnsN5qN4Y9BpLZgoWn9cF+gNq3zov3/TQxHSqe9ucFHTAfsNSBoZpHlvGJhOM
         hqIg==
X-Gm-Message-State: AFqh2kp2REf4m34lWayGMzNMutF3F326Gxy93CUiqkR7fs2C5lIRJFqS
	8mtFCPw2R/83TzIZYfgmOzY=
X-Google-Smtp-Source: AMrXdXvi5QH529NwOmm7gHJXIptr4+dip1pFVnwCPyaLoFmir/WK8+16wjkvkEQsJu0L6Nqw5n2SwA==
X-Received: by 2002:a05:6402:1ccc:b0:49c:fdd2:a47d with SMTP id ds12-20020a0564021ccc00b0049cfdd2a47dmr19921164edb.37.1674236573483;
        Fri, 20 Jan 2023 09:42:53 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ec49-20020a0564020d7100b0049e249c0e56sm6696891edb.56.2023.01.20.09.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:42:53 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
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
	asahi@lists.linux.dev,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v13 1/4] of: Introduce of_translate_dma_region()
Date: Fri, 20 Jan 2023 18:42:48 +0100
Message-Id: <20230120174251.4004100-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120174251.4004100-1-thierry.reding@gmail.com>
References: <20230120174251.4004100-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This function is similar to of_translate_dma_address() but also reads a
length in addition to an address from a device tree property.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/of/address.c       | 41 ++++++++++++++++++++++++++++++++++++++
 include/linux/of_address.h |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index c34ac33b7338..14f137a21b0c 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -626,6 +626,47 @@ u64 of_translate_dma_address(struct device_node *dev, const __be32 *in_addr)
 }
 EXPORT_SYMBOL(of_translate_dma_address);
 
+/**
+ * of_translate_dma_region - Translate device tree address and size tuple
+ * @dev: device tree node for which to translate
+ * @prop: pointer into array of cells
+ * @start: return value for the start of the DMA range
+ * @length: return value for the length of the DMA range
+ *
+ * Returns a pointer to the cell immediately following the translated DMA region.
+ */
+const __be32 *of_translate_dma_region(struct device_node *dev, const __be32 *prop,
+				      phys_addr_t *start, size_t *length)
+{
+	struct device_node *parent;
+	u64 address, size;
+	int na, ns;
+
+	parent = __of_get_dma_parent(dev);
+	if (!parent)
+		return NULL;
+
+	na = of_bus_n_addr_cells(parent);
+	ns = of_bus_n_size_cells(parent);
+
+	of_node_put(parent);
+
+	address = of_translate_dma_address(dev, prop);
+	if (address == OF_BAD_ADDR)
+		return NULL;
+
+	size = of_read_number(prop + na, ns);
+
+	if (start)
+		*start = address;
+
+	if (length)
+		*length = size;
+
+	return prop + na + ns;
+}
+EXPORT_SYMBOL(of_translate_dma_region);
+
 const __be32 *__of_get_address(struct device_node *dev, int index, int bar_no,
 			       u64 *size, unsigned int *flags)
 {
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 265f26eeaf6b..376671594746 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -38,6 +38,8 @@ struct of_pci_range {
 /* Translate a DMA address from device space to CPU space */
 extern u64 of_translate_dma_address(struct device_node *dev,
 				    const __be32 *in_addr);
+extern const __be32 *of_translate_dma_region(struct device_node *dev, const __be32 *addr,
+					     phys_addr_t *start, size_t *length);
 
 #ifdef CONFIG_OF_ADDRESS
 extern u64 of_translate_address(struct device_node *np, const __be32 *addr);
-- 
2.39.0

