Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686836;
	b=Y0IUXX9+OKuyRzO0N3n/oBMldrSBt2A+Rnch2lbgI3XUso5e6n9TapiJ7jUgkorvbuyq
	 hkv4n0k3bbwUYD+89xKXhRR3Z9xqwC+VY07BxOuEHB0P80hby7oCbpHoHLS9VOdq8bBDA
	 yeDs7+6TbvY1d9OjjwIGfITDG8xF4Ofpy0N1EtSjqT5jWjaGNoEj7E5l4ScS9wcHSbmcy
	 bPglPPGj33Ymz0DoZbMjhk8uvuZZK7eOVmrk8wI9Mb3hK7Aqdj31pLWOEO+ZwkRt8biO/
	 6X/h08LlkscmAezytv0DNtd6RagN+ILmYRvt1zGpS8EVf1SjovYDh+xB8HAvSjpE1Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=68+IeagKgDrW1nl1tCiiDqs5Zxn2UgVcp46ojvUcCbA=;
	b=uBkJwqBYy9JSO151bHObz0IQUphhUKst+l/nxXRHsZSd0ESuTuLW/Dp7kMxaS8N2+gkt
	 5vG/KT9S98lbuKXGbE0qJEMXFPAMobHhz8wgv/OfOY90dvG1+N4pBwCC5gBz9pStkRWT5
	 mU53FyKZ7tKyMm46eYi2SevlxR/Hd0nh/zriTVIKExFFt5eD8fcLfChQ44AN/XttlPU1J
	 Wm2sD8NaiHITQYrT1cQGKiG8HwPIuHK408ZEzlazkvnpbSNThwN3kRWUgCm+CQskbu/Zv
	 Qkv30FQi8JDLc0tvfV4scpuwnnoQkRUWG0J5XzfkrvbEct+IALNKlxQwHx3ChFZqaGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qaiM1DEa;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374BF606A31B
	for <asahi@lists.linux.dev>; Thu, 22 Oct 2026 16:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 374BF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qaiM1DEa
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91befe703c4so531006d6.1
        for <asahi@lists.linux.dev>; Thu, 22 Oct 2026 09:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792686835; x=1793291635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=68+IeagKgDrW1nl1tCiiDqs5Zxn2UgVcp46ojvUcCbA=;
        b=qaiM1DEaOhw0u3fobOoWvg8EPzfHlUGr51vRoJEPQaw0UUPDIHEtiEtPwjnj22GGox
         Sn2vBwzlYP934LnUVZ+BJmui967tZ9Cuuj7VoWkKeGcXp13Qw+UEywTmOtNPLNeYDvSN
         AHGiIXllQu9D7p2g02P3FPb0WDE9+er7p8oAukHQzEHvBsTwnkvwV0dCgdUpXDUKtDKJ
         1vT7iEp7dsuENhQQiR81dwNUElgaFMarArRbIFIKZ79G6wsKdU5NtWmd3Lo8mdK/GPUL
         TSKelGQrag+7Twqan5p4FQPl8Kj4rsUWzk4co77BWK5gM421uZ3HCcnLSr++D/3pbdpW
         ckNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686835; x=1793291635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68+IeagKgDrW1nl1tCiiDqs5Zxn2UgVcp46ojvUcCbA=;
        b=2b+ma40defkJSFa+uo3uARrIQ2Q0lb4f3w2HCrFjV5HGIBTFcALmiy7k/lRGSpDAZh
         e+fUp6QGXJg18CMV66kKdGQDNv+1xnmDzYGAV7qRujP1MSOQ3wBKHV//k9rqhPYLA3oH
         mv995uFROOjC6BDLawNpizVkry2PvyUwjGEFgYtzGRZRSn3UF2Ub4v5VTBdldoC/BkrS
         v0dZdMXoE8HNZ++wVZAd4wGssTbVTimgkIZCVkaXQn3xmQBeplvEhHnbQVY+WJFXZrQm
         ovcmdd+FvaAJF2hPJF/x3od2RRM/Ry+5N8EAHqQda9i5LGuIXqxeX0sI8psgfRrad/p+
         Dk2A==
X-Forwarded-Encrypted: i=1; AKwUvByiXEPTXSTOKGi2FhpsOdPLR0M/G+Lh6k3diDaQ0mzT6WScrDI1PIw0zr3N7Oa4LFsUj7GxyA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLVKscCTJWas5YN9HLPIghlGAdktVhjSWpaFR5u9Q0iDSWis0Ta
	QsCBa65ynAkqjCFV+7+FYzNOgpEB4KOopD6bFw7Xxz4Ahnj0eSKt2oNL
X-Gm-Gg: AYBFou3AoypiofYZLb4dj5UlPnZ00oLUE1BTcE0QEhbQZSa8iXKxAgBeS0WLmddTNtV
	0XbSdS9oDgyI5NnIDMv/nqVr4+WKZotHZp1DkX1jN020x5yY5YIW9AfU2Dz5wWaQhD2xIIsI/kf
	9Qqw4ZaElt9U9GJm37y4NX/WN0oF57i4gwqmlIZOy48TZLzqRmsXyxyDAARVXTJZYxf0XFutoH3
	/vr/CVS7Xcusxx4CdlfZ6/ALUjgkONfGuubRNTE6DH1FqtmWNWGcuDpbQkl6y0Q7kLqxLGTTTgS
	KXXIHF0kK3UnmkXkEfO+W2cz/blGCudHx/oXJiVjoMYs8oUqxaRPxutx9fyTr7iRP3ZpwUeF+Fr
	nMepkzczg0DpMLJiKs0B1PDWhEW2Ub+fhv699wntXSwI2pijkWrXQJvGopxo0XImjkzBwtx58GQ
	hwJnx3i6nU8U9/gVM57dG0AL0YKGHCGKWvES32uDq0yUYV5rrP45xYA3q0UGrh/f2pDdpc3Up3P
	qzYMeVHXLVyIX4bh1u551ixZcRsKOj16MYZ+h6QeIeemn0UES4K/CdqMvLlc1T2DkXLYFVV1dHf
	DMB7dSk7Ty1JzZvoS5vETxvj
X-Received: by 2002:a05:6214:2026:b0:91b:5d3a:4fcc with SMTP id 6a1803df08f44-91c12f57cd8mr99901036d6.57.1792686834990;
        Thu, 22 Oct 2026 09:33:54 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c36f0abedsm1511396d6.3.2026.10.22.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:33:54 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>,
	Robin Murphy <robin.murphy@arm.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] iommu/apple-dart: Report TLB flush failures from iotlb_sync_map
Date: Thu, 22 Oct 2026 12:33:40 -0400
Message-ID: <20261022163350.23743-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

apple_dart_iotlb_sync_map() flushes the TLBs of every DART the domain
is attached to after a new mapping has been written. The
invalidate_tlb() callbacks return -ETIMEDOUT when the busy bit does not
clear in time, but apple_dart_domain_flush_tlb() drops the result and
the callback always returns 0, so iommu_map() reports success although
the flush did not complete.

Since commit fa4c4507099f ("iommu: Allow .iotlb_sync_map to fail and
handle s390's -ENOMEM return"), iommu_map() unmaps the range and fails
when .iotlb_sync_map() returns an error. Return the error from
apple_dart_domain_flush_tlb(), after still flushing every DART of the
domain.

Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
The unmap path is not changed, as .iotlb_sync() and
.flush_iotlb_all() cannot report a failure.

 drivers/iommu/apple-dart.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index b160fb464c5f..1119769f9f51 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -494,9 +494,9 @@ static int apple_dart_hw_reset(struct apple_dart *dart)
 	return dart->hw->invalidate_tlb(&stream_map);
 }
 
-static void apple_dart_domain_flush_tlb(struct apple_dart_domain *domain)
+static int apple_dart_domain_flush_tlb(struct apple_dart_domain *domain)
 {
-	int i, j;
+	int i, j, ret = 0;
 	struct apple_dart_atomic_stream_map *domain_stream_map;
 	struct apple_dart_stream_map stream_map;
 
@@ -506,8 +506,11 @@ static void apple_dart_domain_flush_tlb(struct apple_dart_domain *domain)
 		for (j = 0; j < BITS_TO_LONGS(stream_map.dart->num_streams); j++)
 			stream_map.sidmap[j] = atomic_long_read(&domain_stream_map->sidmap[j]);
 
-		stream_map.dart->hw->invalidate_tlb(&stream_map);
+		/* Flush every DART even if one of them fails. */
+		ret = stream_map.dart->hw->invalidate_tlb(&stream_map) ?: ret;
 	}
+
+	return ret;
 }
 
 static void apple_dart_flush_iotlb_all(struct iommu_domain *domain)
@@ -524,8 +527,7 @@ static void apple_dart_iotlb_sync(struct iommu_domain *domain,
 static int apple_dart_iotlb_sync_map(struct iommu_domain *domain,
 				     unsigned long iova, size_t size)
 {
-	apple_dart_domain_flush_tlb(to_dart_domain(domain));
-	return 0;
+	return apple_dart_domain_flush_tlb(to_dart_domain(domain));
 }
 
 static phys_addr_t apple_dart_iova_to_phys(struct iommu_domain *domain,

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.43.0

