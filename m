Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEED503BC7
	for <asahi@lists.linux.dev>; Fri, 18 Sep 2026 16:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750057; cv=none; b=mYt1q4ClphwVoEubq9p3D1TqL9zStlHtfRqyUrPydkAsnbYFwyiOAPJ+FIImZTNv3f5mxjAmbqHiFWdfyAMLfDl53dadpFWFThnxuHQJualxZez+KoZZS55a2Gznt3aUO7+MuH4Yf1NOPZDXeYTxhS097gTIQFZCLpNKNr1jHI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750057; c=relaxed/simple;
	bh=9ThTR4usKlllKQeYQGdfTkQcMVtWtvUIwI1QCDrW3UU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aEoUAPwzawEGQvmZ+34McJOpVcOJ4IDF3ksrxToEls/lrAklQK1p49r3jr+AwWebnQAx9Ih1lHzN6BCYa52+djktfYKTDdWBfRBetZMZ9RyVS4Fq6nBeR+ULlLshKxy8ogl9fAu8Wt/cmD3e36aXS4rrcZp8/scARWFcpv303Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbjEQv8s; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbjEQv8s"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d20963so724422b3a.1
        for <asahi@lists.linux.dev>; Fri, 18 Sep 2026 09:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750056; x=1790354856; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n6D3MKECmB1Q9b8DagSOBbCm9EGs/3yp1gtCOGWTpSk=;
        b=dbjEQv8s2ne3IbOv3nUAjDbElMP6XqYWnC4pngFDqXlv755Z5mmogi3BBEk5JD7TV6
         j8lfa1yKAQZrM33IaY7CdrhpzXMKHwmXSYr7vGwTJUY1EDuxW+bLR2lq9ZWwsj9Z6sNa
         6QyzVhXMI6kOh/lXk1lbrMJAIy6ZKFEtvsJsst2EtT3gYoNkZV1z5vcGI9zB1pF4hE+e
         BW+v/dEEEg1cVe3Bf/de4qWpLzf3cEQeC4SxQh4bTiIoKqp/RRYmm8BP4LOUtzLbpXcb
         5H+aGTTgXQ0tXI0GKe+oXGK38CR/JO+vXHOVD/su7jiLQQtQgqlSdXtoM/6qHggf7bT9
         5wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750056; x=1790354856;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n6D3MKECmB1Q9b8DagSOBbCm9EGs/3yp1gtCOGWTpSk=;
        b=SzJCvBKNzjhUslRIlhOHPpFAyIE6QSzammq6IbuwVvIdw3V2VJGPxyWauTpRnivPsv
         ONj+Fhi++i/U2zSXVXmjiTcxdLUYY7wd6fKRblEAXRVrSOJ0RQZmbah+fkpDwjWnJGVZ
         bP3/U7RiRla/HzsX5kWw3yyqDre7wnsBbP0DQrKduxX+t6myhLD7nc6M2cwzSKpMYdDQ
         cSKJdh8B21qpfH+T/9sA3xmqqO+dizugZ1TluIfkD77yvRkiUIBINOXwXodDw1eN9fkk
         XDOeoF2rO0dLlMBiVmdlwYHYb0nui9865l55Hr4SrxbYL8bdxx+bddepzo1IVvpgd0/P
         tfGQ==
X-Gm-Message-State: AFuF++m4FqfpbioUfxlNej0uYAEoXZtFMSG8wfOcqCcn5GW+W0Y72uB2
	PltHGMKHuYp2fHGALFc/Uc3GiNNE98yqo6+SR/rnq9n7sDhEDL+dC22f
X-Gm-Gg: AYBFou1u4qIXd8aGm4QsR7cK0AOQajw3nmomRNTJLjDzZ5/0ATPqmLaSp/SvTPn1hHb
	3V87MP2LFpRjb95mq6DC/yseGNU0lOA5hHtgSR6LPV0Fq1DyuPBtj9AlDiQglpr2v+nnPgy9K+h
	g+P8ThIbtoj4kofkQu/kouFmDHBiu2lsojhKt+RJTYWoZ5z2sO7ucDZckhzdHypy54koxysdugX
	gALnmVEkMGlGLMi4jnoFXJWecxVSi3dXiiF6nxwDgqa5KiuP5ue2sNlqrf8b5YWlTpf7vq+FhWa
	KYqPWWOx5mxkqzx2BKTMxBvBfp9nfm03kDIPsh6WTCeJjCfErob+Q8/dGKR3eAUY9XnARkJbLW3
	vTk+s5Z/NAkbPDgTxR0SU7/mR95OdEajtsfllqsYfjH/2Ba+wqsSQyDugsR9/+FE95jTjyOdLVx
	tDGg0eulwq5rFHsbRUc7YLIfVTMuUW8XEXp3mEh+0qB1WNx9cCk8G9oHABQi4/Qws1nNOnXZjHZ
	VlfreWaGU8=
X-Received: by 2002:a05:6a00:4196:b0:874:708d:b637 with SMTP id d2e1a72fcca58-874df800839mr6021748b3a.35.1789750055865;
        Fri, 18 Sep 2026 09:47:35 -0700 (PDT)
Received: from [127.0.1.1] ([223.122.38.120])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-877a8dfe201sm50514b3a.18.2026.09.18.09.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:47:34 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/2] soc: apple: rtkit-crashlog: Add AArch32 IOP state
 parsing
Date: Sat, 19 Sep 2026 00:47:02 +0800
Message-Id: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQ5AMBBA4avIrE1CUT9XEYtiMEErUxGJuLvG8
 lu894AnYfLQRA8IXezZ2YA0jmBYjJ0JeQwGlSid1GmFcq58opH9KnEQ45fNzajGiSqdF1mvMwj
 pITTx/W/b7n0/0qGdUGYAAAA=
X-Change-ID: 20260918-rtkit-armv7-crashlog-2dfe86453b63
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=784; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=9ThTR4usKlllKQeYQGdfTkQcMVtWtvUIwI1QCDrW3UU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqrWsfexwtBAWkKYwS3MiJyZn7cTBuRWss6Kylh
 VQ5Upp/K0WJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaq1rHwAKCRABygi3psUI
 JAnKD/9KcNtXTJThW/oYrX6AuZvPBkFL4cKG1KjGW8UZdPaOwY7mplNnesgBdScWem3kqA3it4z
 yuN10j2LV4F5X+OUWqKW8oQAKhtDnTwZhzZjPaO4H7+zw34dnDj7GVzVZ5H+uvvc02YjidfhLHu
 zKoN4hKN0706khQrDj6f6UCCBR8iNPyS4LyWnuDYzpIZvRnSAn+8cP221UA3lLJZ6ICcbw36nvY
 l6NIKpZ6L0TxRjhQhwq/RdrzLOMu8f+41XVqq/UX/Fqx9Szror5vFiMWHd14DbqtArKudSR9Yi8
 9v206cnl/BbV1IAqawlnzslkxUo19HiIZ3HqveIB69bz5WGliPAv8/JTGqpZtkjqxuJPMIBun42
 hxil79HgAUgVFUs226Agxo0IgDL7z6juaYUlRI9EdAyQ+f5E+pbWw+kiqSuoG+asR/uTZ9bsTx9
 QdvuHwR2TmuXNJck4VwJNhhpqGM4nGr32SdlJ0hRnfycXmB0F1antz3c8l+5IM5gyCJ21zfxxFo
 dMKEfTl6ONzG4OPwxFkM48OcyXRPI5PNslw7U0G/4rBZ3F+CNnibmVuqIFXNhNZfEazvveE8MRr
 OHT364iCn23+MuCoMFZdXzZ7pCP3ODotL+da0UxVMA/mMim7zYqrkDoVbRsECG1B1a2aXZyVuCU
 0E3WPsnO33qh5Lw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Some RTKit coprocessors runs on AArch32 CPUs. When they crash, a 'CrgA'
crashlog section may be reported containing their architectural state.

It is useful to get it so as to figure out what the firmware was doing,
add a decoder for them.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (2):
      soc: apple: rtkit-crashlog: rename 'Crg8' section from regs to aarch64
      soc: apple: rtkit-crashlog: Add support for AArch32 state 'CrgA' section

 drivers/soc/apple/rtkit-crashlog.c | 139 +++++++++++++++++++++++++++++++------
 1 file changed, 118 insertions(+), 21 deletions(-)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260918-rtkit-armv7-crashlog-2dfe86453b63

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

