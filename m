Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1293BBFA9
	for <asahi@lists.linux.dev>; Sat, 22 Aug 2026 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787392290; cv=none; b=Ocm/gPV8Xj5LNwPCAy3LfKy01gvRhSsdmbXOeV1T5aLv3JTuX+Tdh6/RyjjPMcmtgcSFRRq7krnzObMwEiAOm3rx/ZDtzexu8/yjxKimPMfTAb3I02nw2WqBD8XT8ZigQOvgwOaNevvTogdXY4XPJhSeeN8vC8CWE7hpXoF18uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787392290; c=relaxed/simple;
	bh=jyRNjYIpRPZnGIShpD6aY/YuoYpc1xXghFay8M24Nnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gCpy2AWaa44734Ob5b5b/kjcBtm2n1s/vMT4n2fxcXzXnDDaqYlEgqbWK/5NxYQTN2+xODnOjM44UQyxNZfCdMH5fdfwfV89yjV9wUocNE+VfrK4yfqtotKiejpW9JzDr9y4AF6LOpdLMbAKG2GakFOHZuGjb/+nkObcspOSN3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4jmozK1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4jmozK1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso24626165ad.2
        for <asahi@lists.linux.dev>; Sat, 22 Aug 2026 02:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787392288; x=1787997088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3DjOJK7xDoaF8DBdXDTvBpCyBMM9nbKuBHTtDt30EA0=;
        b=n4jmozK1+XSxxwbrsioiLZX7JWEzv7wbiQ/NtpYyKS8jCci7v5lpaH5JT/Y71Xuxdt
         /sxmQxnberw5lkTywROapFCoqZry4Zej1Gtqg6NIefbl10/7bd0bn4+UuSGZjWb+a4wv
         rmeOv4hNImKcajw8aWSl/5l/duvF7cxg33sI/fo0vmHtdCvWqVwmX1TwYoCK2e/GrHGy
         D2gki5lq+RiwQWskQJVbPWEdDed2TE25pH5es2A1OPK8s+9XhNhSCQHCZ9kEf4AYwqfQ
         MgZEp+f3H0g+8zD/67BOg+Ly/R/+5QOGhKUjqK6p4VwGaYkm+Fpyo2czfZJqdPrgPt/m
         PlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787392288; x=1787997088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DjOJK7xDoaF8DBdXDTvBpCyBMM9nbKuBHTtDt30EA0=;
        b=Z3OKDMf3erK2wGXvvdw/W4bz+d4hJZ4qYLG1NkzgXyPkLsWdIcbYfg3GF/C30QH9Yz
         p1qH+9/gkqu/ZAbiuYXmnzpHCuXpINUqtxUzFOBUMSu6SQxuVD5dpeh8xr/aMUF60LeD
         brLw9jWkDD6MjYK5WEZ5Ln0Bt0GPFuqtp1WzBLQP6QDBLGwaUgDTXnrb21zxJmMado51
         epd7HqSV4ejtp3+APVdG4bOA0PvKDkMKArSDFTfNl0oO5G+E7YWPL5NhwcjcuELDUECT
         5edDtHBSdHOaJlVtmWdKymE+WhncfhA6fnjrlQP5X3XpHC7GZyHcpsBVSsdwTR7Fc1a3
         SbbA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0Sy81qxyRevw3k6UOvlStoU/S4vhTRW0zNTEo4JGDAtm/lYiUgAPn8svdEuZZe4uH7+ujCw==@lists.linux.dev
X-Gm-Message-State: AFuF++nPdDaGa9/sbrxOBHcWqLEffG/0eGUQFmzvpedP5XVGnunhFWoj
	rY0sXDXeE2iYp4ZnlXteC+614pAFQ3RgZjrCHjjyEY+Sh93EHO6iOkGR
X-Gm-Gg: AR+sD128eSHxL/7JQepVCbzEs2bkPcsMUCNmbhIj0qlw9Xt9ElIkX2nPFDZv6rlTqmK
	5Vp8IFPE8BqPBT1ZM6uQeMjQk70Zsg1HZhAhSXUfSXfKWMlxaSrIUFcl18VqamI21ivoiuSGry0
	mPsFvr2HDM424bjMuOl+iJErBzWeo9GSIGos01uH9rr4+s8mVz+0jp9zC9ysixhkPzFd9MDb4dv
	0etSUAmWcWYfll2eJ2xt/4rVS2XU2LZcq5CFD0Fko7TbRGXUqP/fUyNePBQ2STshbvD3NXqDdw7
	UPHzXyngD3/xaUfgBX2ZKjucRkmcCGEDI0DVT1yeeZjT6UUGCjFTFZHnMoOWqUsUtFpRhi0Caha
	ufkRhgKB89KcDFmFEFN/bHcdL+UdRDEonzEkypQQR6P7LzZDvUNaNonoZGmv11Hgrl4z5ZjUseg
	zQ8MuvVs3trkVaBN7ZTuN4Rlz/JchlW+b6F/MH3fxfHyRy20vyuG5/bXbFEE8JAYwaHaOHJ+mTD
	LgmE2rV0a74GXYas5hrn3eC2wP4tpnhewpqtZuQtQ56MVgPkam650KYAu2Gn3cu1247roOK/8ZZ
	hxjOIvhmokyg/7GB7LxO+ZutJIUhe+bYcKGrJIVXX5SlUBGyGHvqsEu1B9EpvfrK4mgACEZ22Ue
	W44XC9wG9sLByMCAK3kGaoj73u63PWhTTCfSwERblnWxge0wRs5vO0HxU1w==
X-Received: by 2002:a17:903:b07:b0:2d0:cc92:f7a9 with SMTP id d9443c01a7336-2d64add1daamr229443285ad.4.1787392288034;
        Sat, 22 Aug 2026 02:51:28 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm5244881eec.17.2026.08.22.02.51.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 02:51:27 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] soc: apple: rtkit: bound syslog copies to the shared buffer
Date: Sat, 22 Aug 2026 15:36:21 +0545
Message-ID: <20260822095121.53451-1-acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

apple_rtkit_syslog_rx_log() copies a log entry out of the coprocessor
shared-memory ring using an index and layout that the coprocessor
itself chose (SYSLOG_INIT n_entries / msg_size, plus the 8-bit idx in
the LOG message). Those values are never checked against
syslog_buffer.size, so a compromised or buggy RTKit firmware can make
the kernel memcpy_fromio()/memcpy() past the DMA mapping.

SYSLOG_INIT also accepted msg_size == 0. kzalloc(0) returns
ZERO_SIZE_PTR, which is non-NULL, and strnlen(..., msg_size - 1) then
wraps to SIZE_MAX.

Treat n_entries as a count (reject idx >= n_entries), reject a zero
message size, and refuse shared-memory copies that do not fit in the
buffer. Rate-limit the new OOB warning so a coprocessor cannot flood
the kernel log.

Fixes: 9bd1d9a0d8bb ("soc: apple: Add RTKit IPC library")
Cc: stable@vger.kernel.org
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 drivers/soc/apple/rtkit.c | 73 ++++++++++++++++++++++++++++++---------
 1 file changed, 56 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index a3fdac8f6f06..63b85d082a7a 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -348,14 +348,28 @@ static void apple_rtkit_free_buffer(struct apple_rtkit *rtk,
 	bfr->is_mapped = false;
 }
 
-static void apple_rtkit_memcpy(struct apple_rtkit *rtk, void *dst,
-			       struct apple_rtkit_shmem *bfr, size_t offset,
-			       size_t len)
+static bool apple_rtkit_shmem_ok(struct apple_rtkit_shmem *bfr, size_t offset,
+				 size_t len)
 {
+	return offset <= bfr->size && len <= bfr->size - offset;
+}
+
+static int apple_rtkit_memcpy(struct apple_rtkit *rtk, void *dst,
+			      struct apple_rtkit_shmem *bfr, size_t offset,
+			      size_t len)
+{
+	if (!apple_rtkit_shmem_ok(bfr, offset, len)) {
+		dev_warn_ratelimited(rtk->dev,
+				     "RTKit: shared-memory copy out of bounds (off 0x%zx len 0x%zx size 0x%zx)\n",
+				     offset, len, bfr->size);
+		return -EINVAL;
+	}
+
 	if (bfr->iomem)
 		memcpy_fromio(dst, bfr->iomem + offset, len);
 	else
 		memcpy(dst, bfr->buffer + offset, len);
+	return 0;
 }
 
 static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
@@ -384,9 +398,10 @@ static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
 	 */
 	bfr = kzalloc(rtk->crashlog_buffer.size, GFP_KERNEL);
 	if (bfr) {
-		apple_rtkit_memcpy(rtk, bfr, &rtk->crashlog_buffer, 0,
-				   rtk->crashlog_buffer.size);
-		apple_rtkit_crashlog_dump(rtk, bfr, rtk->crashlog_buffer.size);
+		if (!apple_rtkit_memcpy(rtk, bfr, &rtk->crashlog_buffer, 0,
+					rtk->crashlog_buffer.size))
+			apple_rtkit_crashlog_dump(rtk, bfr,
+						  rtk->crashlog_buffer.size);
 	} else {
 		dev_err(rtk->dev,
 			"RTKit: Couldn't allocate crashlog shadow buffer\n");
@@ -422,10 +437,29 @@ static void apple_rtkit_ioreport_rx(struct apple_rtkit *rtk, u64 msg)
 
 static void apple_rtkit_syslog_rx_init(struct apple_rtkit *rtk, u64 msg)
 {
-	rtk->syslog_n_entries = FIELD_GET(APPLE_RTKIT_SYSLOG_N_ENTRIES, msg);
-	rtk->syslog_msg_size = FIELD_GET(APPLE_RTKIT_SYSLOG_MSG_SIZE, msg);
+	size_t n_entries = FIELD_GET(APPLE_RTKIT_SYSLOG_N_ENTRIES, msg);
+	size_t msg_size = FIELD_GET(APPLE_RTKIT_SYSLOG_MSG_SIZE, msg);
 
-	rtk->syslog_msg_buffer = kzalloc(rtk->syslog_msg_size, GFP_KERNEL);
+	kfree(rtk->syslog_msg_buffer);
+	rtk->syslog_msg_buffer = NULL;
+	rtk->syslog_n_entries = 0;
+	rtk->syslog_msg_size = 0;
+
+	/*
+	 * msg_size == 0 would make kzalloc() return ZERO_SIZE_PTR (non-NULL)
+	 * and later strnlen(..., msg_size - 1) wrap to SIZE_MAX.
+	 */
+	if (!msg_size) {
+		dev_warn(rtk->dev, "RTKit: syslog msg_size is zero\n");
+		return;
+	}
+
+	rtk->syslog_msg_buffer = kzalloc(msg_size, GFP_KERNEL);
+	if (!rtk->syslog_msg_buffer)
+		return;
+
+	rtk->syslog_n_entries = n_entries;
+	rtk->syslog_msg_size = msg_size;
 
 	dev_dbg(rtk->dev,
 		"RTKit: syslog initialized: entries: %zd, msg_size: %zd\n",
@@ -441,10 +475,11 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 {
 	u8 idx = msg & 0xff;
 	char log_context[24];
-	size_t entry_size = 0x20 + rtk->syslog_msg_size;
+	size_t entry_size;
+	size_t offset;
 	int msglen;
 
-	if (!rtk->syslog_msg_buffer) {
+	if (!rtk->syslog_msg_buffer || !rtk->syslog_msg_size) {
 		dev_warn(
 			rtk->dev,
 			"RTKit: received syslog message but no syslog_msg_buffer\n");
@@ -462,17 +497,21 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 			"RTKit: received syslog message but no syslog_buffer.buffer or syslog_buffer.iomem\n");
 		goto done;
 	}
-	if (idx > rtk->syslog_n_entries) {
+	if (idx >= rtk->syslog_n_entries) {
 		dev_warn(rtk->dev, "RTKit: syslog index %d out of range\n",
 			 idx);
 		goto done;
 	}
 
-	apple_rtkit_memcpy(rtk, log_context, &rtk->syslog_buffer,
-			   idx * entry_size + 8, sizeof(log_context));
-	apple_rtkit_memcpy(rtk, rtk->syslog_msg_buffer, &rtk->syslog_buffer,
-			   idx * entry_size + 8 + sizeof(log_context),
-			   rtk->syslog_msg_size);
+	entry_size = 0x20 + rtk->syslog_msg_size;
+	offset = (size_t)idx * entry_size + 8;
+	if (apple_rtkit_memcpy(rtk, log_context, &rtk->syslog_buffer, offset,
+			       sizeof(log_context)))
+		goto done;
+	if (apple_rtkit_memcpy(rtk, rtk->syslog_msg_buffer, &rtk->syslog_buffer,
+			       offset + sizeof(log_context),
+			       rtk->syslog_msg_size))
+		goto done;
 
 	log_context[sizeof(log_context) - 1] = 0;
 
-- 
2.51.2

