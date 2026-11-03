Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714399;
	b=0BAfb1jJ8p6rtaE1Wp5QIf7YOYSOS41S2tjxs6opRliwIkc65kMyb40iUDkZ7530HIfk
	 WOceuKJ3oh6sevx/rjW9quHSgEmpjPFWfgrglI0NUrv8t+PF31GGisWiHN7tiBa6rDOHx
	 Te0CRjHPMIMtM08+eB5iabwh6c4eUyWySXQV24dsjmvUW+3zMH3/GX5gkmJVqcuc0yWJp
	 IIWQxl358xbZOQul2OrWvWNZ4frJMGl8taMxXumLabrx+4YdLDyILFeUkp0INndBVHzlT
	 kSu2u1j686FYDzt4mGbCsl0urod/dYwUtItbcNWzSFCScJ6xvNXhdZ4UAZjRRft/qOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714399;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=xnAMlverv3/IjELyJ32hRjwWOMBKoAty6kX1tfLCe1g=;
	b=uSXjHpQJXlTk/jvXHzNb77Ie/Uh0/JMCuMbExSWlzTrq5uVxDCd0+YLGdTkW5YmHmzYA
	 Z8sXVCZ8sGHVRNkxfTLbdWfuUnGcUijI5NZorLUnOX/V3aTpTmtPMaAd8DukvQW6gP99T
	 vHS806Zg1PCSsdxfej7KsEc54ODq5sHtqx4mG9gwtmRE7V1S2dZVoyZYAUGtozyAbOxY1
	 864I0ZWk6aOepx0R/RfDlQudV4qXhebbURpZnfZxmdb6qt9eIku0fQKVxXC5hPDfTF9sD
	 jbsOWhWzfXoKChO51H4/A9xzrO3x2MmZ92b0OsReHzPqOLAJvW0YIW1YiU43W7scNkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XSqCvZZY;
	arc=none smtp.remote-ip=209.85.160.225
Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B816085085
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 13:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B816085085
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XSqCvZZY
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-53e1d40628eso9478911cf.0
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714398; x=1794319198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnAMlverv3/IjELyJ32hRjwWOMBKoAty6kX1tfLCe1g=;
        b=YlcG0U/J3QjJdG0drmfX4eOhegNg0bapR+8/zUCoeeLizsyi6R4nRHUigPesyuQI1c
         vKRtD5UD7aqu08rOsNdX1EObrfQ3gxejlN6uOTfGf1HzZlwUrSea/AY3/XNSagdzsIU2
         X0nz0zqV4GG3UVmoG8YPBdd+otaoWjQx5aw5IQ4XwR+AJjtU/oL7Nwa3IvGucenqnlEG
         SjnbduNxb8O3+ZHt6LnfLF02UQRWGqO/3aoLnXt8KYHb4uGMkekNr/G+9u6qUufc4tX2
         uOeeNHIsYYOByLpzsQxkc8NH6fCj842BoLpZfd1oDX+7ehmPO987rfd8PTKlSQD5gh+A
         Jdmw==
X-Forwarded-Encrypted: i=1; AKwUvBxOLsXgpbX6K8pd/Fahs1Rj+BZLUH2Vf/IDw4jNOSN1AwkfpWqCWRx1AY6YSDtshZHS9aRAcg==@lists.linux.dev
X-Gm-Message-State: APuU4Z94h7Wox1NboUimUEpKwFfoN5ju45kF0afF7lFo1R9b3XFxC0Sw
	TBqU1QV1czkTAa8IxMFShs3vY+zkX6bAcoB+PBqJEuVPYMPiHLBc9ozs/CdOi9E+1tQYfvoidGI
	djYy5tGKOj0ZYq0ZDTsme68mVHXCHRT+lI4o/fHRzxYznJtzxDk2RN+CVhGw3y5DgUDI7Xa97hr
	/0HEnwBtUHwOz93XT8YRFxb59e1kG28q1oAWNnHAPs142dyWm9gtNthnjg5YBrYYmqERz0ReIk8
	DTPSarSkv6/F3YG
X-Gm-Gg: AYBFou2fFUsVvqQCRW4ZmvjYcjbmNJMfgcthsEa/w9cJ9TdyBGLvHh5m8WllDI9iomz
	dEbxdUVCdVZ4mEm2I3yb7tk6LGuNB6x98UHQsPmjSfKeb3JVR7ICroIWyhlS5pCZwWAq1g1wZj5
	aVfq4MdMAUkA2+zx036hj0RW+E7MCBZ9lhkopCionw4WKmYiT6XRX0aCe4lILcNC6T6O5ahH9tM
	D57rmdrmdKN1TiaC5GqMLChLtrNdu4dKCHBOBs74YI4sbcv9Ztrn7pkk1+UoqLPnG0+CXmAIntw
	GkBSZfn3WQ0JAMjC+aeJr3IxVdINKS5zaAM3vlmHRdMCPOy5r7hbwhoGDJgV2x6EULyuvzUGEnh
	kq6LR3qKWKiPXU6VMKsooS/2DhP4i+ZN9AOGbZOZjDs5w5qLpfMgHuw9ed1p/XAUNHvQ4Bqd3sD
	T2FHBFmizvhNUGGCeBbFi5WzUPmMfZTO6rAEEgMco=
X-Received: by 2002:a05:622a:44c:b0:537:548b:77ed with SMTP id d75a77b69052e-54121021fb7mr250286511cf.30.1793714398009;
        Tue, 03 Nov 2026 05:59:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91ca7f4b369sm1533646d6.30.2026.11.03.05.59.57
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1ab289bb41eso474921c88.1
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714397; x=1794319197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnAMlverv3/IjELyJ32hRjwWOMBKoAty6kX1tfLCe1g=;
        b=XSqCvZZYy6UCqM7cPZ7tLuBHdqVInJI7ewB7yVbNHYzUz4RTxqn1pKzrzWVApY1tw9
         IDBXXCRijtytFpzoe8vDSw0irjfztYKKAsNrnKHZH/5jJ4/dTBYJVJpteZzox7wwVZDw
         W4d0i3onwThJQ37W+uTIAMCXi6TUAcTCLaTxI=
X-Forwarded-Encrypted: i=1; AKwUvBwiM8Dc7FONlh2I1aXgABOpjRQbbHshQnutNykneC9SOX5CO/RvLJv7EryxT4dIeQ03PF0PPg==@lists.linux.dev
X-Received: by 2002:a05:701b:271b:b0:148:ece:8cc3 with SMTP id a92af1059eb24-1a94adc93b7mr20492414c88.24.1793714396642;
        Tue, 03 Nov 2026 05:59:56 -0800 (PST)
X-Received: by 2002:a05:701b:271b:b0:148:ece:8cc3 with SMTP id a92af1059eb24-1a94adc93b7mr20492387c88.24.1793714395934;
        Tue, 03 Nov 2026 05:59:55 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:55 -0800 (PST)
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
Subject: Re: [PATCH 11/13] wifi: brcmfmac: Support versioned join requests
Date: Tue,  3 Nov 2026 14:58:55 +0100
Message-ID: <20261103135856.3676311-12-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-11-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-11-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:46 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Newer firmware uses version 1 join and association structures with
> explicit version headers.
>
> Query join_ver and build version 1 requests when required. Retain legacy
> layouts for older firmware and fall back to BRCMF_C_SET_SSID when the
> join iovar returns -EBADE. Use the selected association layout for IBSS
> joins too. Report unsupported join versions rather than guessing their
> request layout.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Daniel Berlin <dberlin@dberlin.org>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 73 +++++++++++++++++++---
>  .../wireless/broadcom/brcm80211/brcmfmac/core.h    |  1 +
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 19 ++++++
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       | 29 +++++++++
>  4 files changed, 113 insertions(+), 9 deletions(-)
