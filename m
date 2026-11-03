Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714367;
	b=Jf30yTiz9GuLXOWr1CTllT064WJTOD8v3h1fHG47oQrT6JM3A/tZXqPxN0fCm0cqS+iB
	 0F2s/CpE9OYpi3QKAHR7jfwTc3DvkhKkbRoyC7uiiKHnfUWAF9XHCAjmq455309fk5vhU
	 IrfyftWkMO6q6yuArgTNfPWtk7jCXyp1wS3upwF/ojckjfiO4VZTA2rumFOqja6KgwsiS
	 1QnpxRDhFm7NUHZZVQvYDSH0iKB1aj/ueximwKN/44WHZ4spqpsBws7mpNFs6EoNTdIys
	 BTiThEDdZLg1qhZs9lIW71uRjRVi4r6G4kHs7Q51i1oQWPBSwu4JY/bkbFlzPq+/vhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714367;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ObP2EjY6D+HzwangbrGAF+EH007820Bo/Jvo+O4ZYyA=;
	b=DiS/C+SAsmtbO4L7cKYKy5GKBglf9PaJifUy0l16w8hlwxji3uSmivL2KQVHdhN44XCm
	 fgfg08OJOzpcGchOBcZvoX66hhY3tEK1vdLlzQbTFAgfhtUEaswlvD2crFcMrFDyXPiuP
	 0Rsh77uIeqz3JqKDr2YeKL0iiyTcqiCZ4dwg5EKoZjfuLX/Izm10cIuJLryywtCqNsZqG
	 SMhjiPVm/jfh+Vb3PH9TdSx8Qe+hRr+ANiT3zCwTX/aPIz8OXnw5tn+H1re1eNvt1/YX9
	 KVi1a4jDFvyvo17J9YCbyIUytdITS86tGzZZf6RvQPMhmlx5U26vviacct08hD2osVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MzEaL4V8;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533E6606D807
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 13:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 533E6606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MzEaL4V8
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cc147d86bebso525430a12.0
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714366; x=1794319166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ObP2EjY6D+HzwangbrGAF+EH007820Bo/Jvo+O4ZYyA=;
        b=TRQcTOlTO8zcB3OGFpZheeju2gt7+GbJ4o8wYK1zVLmGtzCG7WdS5abS/oY1dWZ8pl
         6GgkMnNi1DePgOIJX2sMZmbKc7e97lzhKtgAOuwr32hBby3giluGr+o01mfib5tb+QbY
         DqYgEPPwMeIR0Qi01wo6l+ImBu19mPtXodsiXUlJUT1fY3qsu0+bWa8ocpJ0rk9MK9Ls
         ElyluVRxaKZdE+15Gq6etdJ3mupjeMZFq7HzQG/K1YlhZuqxixmaXMIRdpoq+hEO069P
         bwDrpkrbLNhe4Qe6tSsQmwbi9ta6ogg220Y4ahs07o5j49i7BaRtkH90Dl+rpDDiurYo
         BUXw==
X-Forwarded-Encrypted: i=1; AKwUvByv9NNIgpZM6yYADKppXzbUkofiWXibp49rUUOAcCDe1OMiMEWx+mppEYr4WRrW2BCTAlYq/w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/G8y2is6fb4nvoG45m3CPHFnCJzgpFYvbrT45EKvm5UulDoJuN
	HyxTZ9fPj/Il/KasuReAlUabLLGRX4C+Ycaa+WPwsi2SYtPQuex3zVutxyoQpNLjc/X4DU6WDxt
	G3Yttu3/hZH+uMsBru43dNAKbbHMLsafolG8+Pc+If67BzQ+bZIdCfCcWSOyYw+j7UWZfSkaawz
	al8q05KqAbyZD5k7YQJSUVGCxPprjm4pJtDww60eimIaLzbk4ROaIOyvdElYmrV36u3qmuq83YJ
	AZ+sN+bX6xccw==
X-Gm-Gg: AYBFou0hh4wOGRxwoxXRpj04ds9vcg9bnqGByYEPfpocqXAJyKxU+95J3sd+9kB1TU1
	EKjKZudrjojqniKPd1sX5md+o2dYj+GcuadZYRximjmO61W0EezIL9tgc9iK8iWbrr/Fi9+73XL
	c+rHD53grK1Lzan3DP+nusvYPTDXjBlVKJr6wDzaZMd+VbzypufNLm9t/qY0mEhfv8bUTN7PpyY
	C8qpP/ytS9BKVQwpIPA1HC3rlLt83umCIdp2QG2w7kTkI+VCFC/9p2u/XCaEG+crmPxFkSqA597
	fDUy+qEROqFGmopjZE9ritPwFAi38amqjOLsd9tEltomIcuQ1KduHMHeBv9Md64ysD39kdE2SrB
	UiJXeU19+IDJhGuZpnVqkUc0tjTeMbX90lh1nIjJqN7E7JVCdmOeIz/yuNitTI5rP4XqgECmDbB
	vHngev5oXmpeWAWFtTHHWKrMxjLMoA+LinmCbuIdw=
X-Received: by 2002:a17:90b:4c4c:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3ae8972b662mr6817760a91.19.1793714366481;
        Tue, 03 Nov 2026 05:59:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae85eb5999sm3477217a91.1.2026.11.03.05.59.25
        for <asahi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a26fe9521so770218eec.1
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 05:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714364; x=1794319164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObP2EjY6D+HzwangbrGAF+EH007820Bo/Jvo+O4ZYyA=;
        b=MzEaL4V805nG4/N2hfURCfBvzAx+qjllsW7/ioo7LTuW+nJTIs3YnKYgA06tD8Qjok
         spTVIrKYMtEwGbNXke9j72H3LXvOrwq9xBlMfMBzd4MEhL/dD1pL/Kvtv1JXUNX3Mg4X
         HizYlmv/Zg2hMyY+H2fJlzHBt83HLyb4FLBWE=
X-Forwarded-Encrypted: i=1; AKwUvBw1rER3JnKwFCftWL1Fkf2RUE6+7hkYIX5LJSIeZaGZ8Jpe9MgfSCRxaIN7OEK1aypS/5mblA==@lists.linux.dev
X-Received: by 2002:a05:7022:f90d:b0:151:7831:e403 with SMTP id a92af1059eb24-1ac5b027fbfmr16236308c88.13.1793714364477;
        Tue, 03 Nov 2026 05:59:24 -0800 (PST)
X-Received: by 2002:a05:7022:f90d:b0:151:7831:e403 with SMTP id a92af1059eb24-1ac5b027fbfmr16236255c88.13.1793714363382;
        Tue, 03 Nov 2026 05:59:23 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:22 -0800 (PST)
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
Subject: Re: [PATCH 08/13] wifi: brcmfmac: Handle larger firmware band lists
Date: Tue,  3 Nov 2026 14:58:48 +0100
Message-ID: <20261103135856.3676311-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-8-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-8-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:43 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> Some firmware returns more than two entries from BRCMF_C_GET_BANDLIST.
> The fixed two-band response buffer cannot accommodate these lists.
>
> Use a larger bounded buffer and register only the 2.4 GHz and 5 GHz
> bands handled by this driver path. Ignore duplicate or unknown entries
> so they do not prevent wiphy setup. Skip unsupported bands in chanspec
> lists and scan results before decoding channels.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 48 +++++++++++++++++++---
>  1 file changed, 43 insertions(+), 5 deletions(-)
