Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714376;
	b=kYF7MpANWJ/tv99mzpdYkmCjzuyuVr3pRkjzsaGCszCgpsGC2VqosYQRz+AfWg1tuUt9
	 m4OCqAIinepFazZxfKGC+kBIlZOnDDbbiQWaAbVv/KfPhLfkJIZu5gLBEF8qR0O1SmMHA
	 eumlaZM5Kqh88oyCgIIhqLYWzhfVPxeSZ7YSOGoxC5m0uX8FGXKcLFp6l+gj4f1fhfpGI
	 KMUdJM41Aec6d+ock3BLz+C6zo4RBvCCkggZ0ucV2HaeVEsXa4dtGgUixuxBi68MmnaiI
	 fHK0bRroDRzFqpN5CqPV0QavGnUFFZu1KSq537ytjhszrvaMua2f4p6Rd0WvbX6/fPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714376;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=43xLL3WpmNZ/pYhKQm6M7yVVXTs8TfUEc4VM7Zt3f3A=;
	b=4nNV4EkPKa+RbbxqM3nZdtmdqwQxuHiU6IeryN3I0ft8gNpyUZP4KPXa2RTjsRWCsAWo
	 cimuCEuSvsOX+nYeIXhYt5/C0zmWY/fM3EOocOAhuBZwqoHBSPB8qWy5wrwe7t0V3kQGN
	 8vaFUCSK9PV7t0RYAB0c79FwzRZT8SMdKeVQI+GD9DlvYRfdOMHaVbthhlA/DyM0qB45p
	 aLcyU0AB+ynPtRYgC/kbafpRak+PV+qZsBE/XVuvYce9u8OIuaJ/1IiwRoAa5+jGf3x6K
	 g+lJTGNx7VmBQjipgD0fjMHkJZ63YWCJJ+C7zEd91ylGk2bTFdMYeJ0W0ooGrAJJ6rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=h0kE53FY;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FEB606D806
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 13:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9FEB606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=h0kE53FY
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so3550596a91.0
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714375; x=1794319175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43xLL3WpmNZ/pYhKQm6M7yVVXTs8TfUEc4VM7Zt3f3A=;
        b=qU2RrhhKhj9QLktLLp7ptUVPAXGGTmua0Y88p6U6Ox2lQq+oI/ARGbUPiYov3JxOKL
         BOIwxClbYc21bQFrpPtsNCzhsBnfSRqokaXb1KFxv9HaTWzwpbCfdZL5OJxTHB2f/w9m
         0Tl+w4KwRXyDm608ZwvUrunUoeXwGjLDsFdmHrqA8KwlgLxK1/T9EcSHx9Umc6skkQhT
         wveey+g9onSZXRooNF31FGB/cLc6LzJ+TcHmjGF6nFRMVl7SOANRHHH6xOsFCxEpbHot
         4Srp5mNbBA+vWXMSCJ/NnB6N3FEppLdP/zp+pfv46CcB768dgxSfzHYxe9YkL4xGc6Kr
         1zfA==
X-Forwarded-Encrypted: i=1; AKwUvBzl8z7abtCwMokW471f2ix42srL6fdgNsX9C5FACjAVqDS1wsWS2EBT8NIEdVUK2fhEP0SmsQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/wcmdkwkY6je26leBb+PS5zyKNuzEbCrXXbJiJZcYWzuIS4vz5
	YmA76OJBjz/DfLGHuPtWWcQW0p2fT5O1SgTePGubDFJA/IIEL8wn/Gyy7axVrFVWC74V82TJfcw
	j0dS69ULRc28tUN0iD6u4/Q/NNUO/7vyfHDr/C5K/5cwUJJjo/3b97NX6a8DcazUod1KiHjKGVf
	MzDcZetZheNhyqd/h4IjY342vHLSgdkxjfkHYEiBJWYnPODXUgBavVlhTcsCkwBGAdymX2Gri56
	DDtSop2uCQKIliI
X-Gm-Gg: AYBFou15ph7xnIlv5JfpETBRrJSu4+gWkZ6pQDfwpscjxq56mmBPXHXp7TfO0btKqwO
	hOQZOs28cLR1wQRnK9WazwbhK6uVzjeJbPYoJzn96c0vG8ME4MqwqQQtzgtEoV9fAWwPboPDb/W
	YgCfQ0OKDsVziExeTMZA+EBRON7ORf6CsJhsvHIKvYVX/VZ0mmfyJh/VS3x+PJL58uoVSzjA6nX
	iykjqoXtldHvzqYl6ZICGAWAmi4/U9WD7zFdUA+QHF9AhZ+ZCBo7us/QhyReELgm0skYQuF92/w
	QVtALyeqA0sncprm4j2N1XomPxb+Dx1utvDa262uTnQaPIlTbAEN+wuciYOTYKUM2QEBlAM+ffl
	RW6glHcVVWoRA1ZV4wgUKBY00YfclZc0BxZVdQ+UUuMWLk5wC3P11VVZc57mrsAWh6wAMVl/s4q
	edfHgZ1ROZXuPMIfJysoafzwfQmBTp7nAlPPDb5iI=
X-Received: by 2002:a17:90b:528d:b0:3ae:5525:dc25 with SMTP id 98e67ed59e1d1-3ae89850a1amr10701685a91.51.1793714375307;
        Tue, 03 Nov 2026 05:59:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae88072814sm4114166a91.3.2026.11.03.05.59.34
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7626356eec.0
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714373; x=1794319173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43xLL3WpmNZ/pYhKQm6M7yVVXTs8TfUEc4VM7Zt3f3A=;
        b=h0kE53FYZ4iVp5XmOke+NABicjOe6QxUX5ClH8L6re4HdhfOkYdR3lqXWvHnVCe87v
         LicMhK9R5Cgni/ePyR0ky/sLngLwO9qR2BobKc+dk3lxeVsLvnwNQzW7AVfz/3wxz6SW
         15s+/mLCu8h3VxK8oiZJq95rXJJVD2oxrGTK0=
X-Forwarded-Encrypted: i=1; AKwUvBwcp5pyVGD8jUywRT/uU7vuCe2xYl94Y1aql1TT0o3UtFfBqRnI9ioCL6rBVj2Uvrwh6Hc7KQ==@lists.linux.dev
X-Received: by 2002:a05:701b:450f:20b0:17d:7b45:f905 with SMTP id a92af1059eb24-1ac5f36ca91mr19014238c88.31.1793714373160;
        Tue, 03 Nov 2026 05:59:33 -0800 (PST)
X-Received: by 2002:a05:701b:450f:20b0:17d:7b45:f905 with SMTP id a92af1059eb24-1ac5f36ca91mr19014203c88.31.1793714372513;
        Tue, 03 Nov 2026 05:59:32 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:31 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 05/13] wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
Date: Tue,  3 Nov 2026 14:58:50 +0100
Message-ID: <20261103135856.3676311-7-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-5-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-5-b5cbc2cde2fb@gmail.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 25 Sep 2026 23:43:40 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Shared protocol version 6 and later allows mailbox messages over the
> control ring as an alternative to the shared-memory mailbox.
>
> Advertise host capabilities using the negotiated shared protocol
> version. Select the control-ring transport when firmware does not set
> BRCMF_PCIE_SHARED_USE_MAILBOX, and dispatch received mailbox data
> through bus operations.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/bus.h |  9 +++
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  | 57 +++++++++++++++
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.h  |  5 ++
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 83 ++++++++++++++++++----
>  4 files changed, 139 insertions(+), 15 deletions(-)
