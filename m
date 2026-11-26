Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655574;
	b=wzgrOmf6qII8p9cnquNeY5XF4bNaBeB4SUl7LKL++5UratJ9LxFOUMxWp4kvW/q+gaFm
	 mcPcNXaqVSmR9giZHzDnYCUiRyJpsM9lN578RnWDeZ5shsa7sOKysxBCqOwp+dyg0NsWE
	 IXSLE6VXuo5kFtqZOS4R7M8gBx9JXCOmvLEHwhQRSCbe4YJZOFgRIHv6BASblFwQFglhJ
	 T5mPDH8ZGctxY3g+HUbMYFtmmAentEfbUHV3osvPMzYw4+GRzyuxKLJcpqmGYqpsofI09
	 05YbFvsWj0F5jHTlffez6MZuStahtceGsObB+r54atUm2AVg9ti+ZDiEEoZ0fH7DJSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655574;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QFPp+98olB7H96ELndfVAn1aKwnYlE7wJR1s/MOg1H0=;
	b=aJ9lW3wWj/rqBqxdcNWIHnWRQBNMN2ewX3akLhaeqFQ2fw/1L5tvwioMtrNK6ol4Bxwe
	 G69XIOL/frChKeMl9+NgnffdwVXPp6Syk0hiIEQlcWM5mN59N1afO+3PgHbIfCosrNI6t
	 D3YaLAkbclFj9mfqMi092UpFwMBzJHGiVUCki33SxqwAVCxxNl3XsckNIRbFnDu8xjNm5
	 7xtRSHeJZhbcdi0u29FYRjZIF6ClliAtBupb2fyqw6HdaoBM1UlmDWBYhlQPWpl1p4Qvt
	 skpTMn3l9CVT523z4CMJPfczUHLVGv1M9K7UeuBnDCpnNYdHUsTLU8dqmfpHMwGc7oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=csebFMpp;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0uU1xHkU;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70F7606A331
	for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 01:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A70F7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=csebFMpp;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0uU1xHkU
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 0432C1D00575
	for <asahi@lists.linux.dev>; Wed, 25 Nov 2026 20:12:52 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 25 Nov 2026 20:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1795655571; x=1795741971; bh=QFPp+98olB
	7H96ELndfVAn1aKwnYlE7wJR1s/MOg1H0=; b=csebFMppgOhUiBbEkbTSRv9iZs
	f0Mv7OqLVjAjyDyr0Lz75ojOLtUOsZ3Sw/N8FIGK/Oj7Jv7uAqygHc0sifPczpeS
	WkKL+zLYZ/nHVWjEB+1/U3XkcDBKGPYljVCk4+fzhkJPGWii3IaA5byD0bIJ2xJd
	aIM7I7mj50iElY8ymTYk4A1CZ7R/IZ17wAMUIvzRBIeO40YEqHpDlABIiUe+aPuM
	b8Fv1wv3JYlQx0rCGhe2rEHlHF3D0RVg0wnIAwCySVXniXoRLXpW3+csrepj1YGM
	O3PyHmOuFVg226bNNFzKcSjYR03m/jy+t8ogTolg83mP07zW+RwLE1x3Gm+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795655571; x=1795741971; bh=QFPp+98olB7H96ELndfVAn1aKwnYlE7wJR1
	s/MOg1H0=; b=0uU1xHkUn32vcdm8XjisZD7aSDs9UE6fsR0vrXBZKC3XJLAvOrP
	F1JpLpdUB1IsKyzIl/ReCUjVBeGzeUDtl+8n6Cpbz0F5asf2yL0LAFLxRVCidm9E
	zNKISMDoXy4fUw1ZuuuHmUtAR1bCdDHNOCpgRT+/moEvtkUQ/lMeTcvz3JD48Qzv
	9y7zTbwE3zaYqbm3JDMTHhcrrHZQ+WHfpmR1hqPVj2f2tvx9ZiGh49D7UIgg8fF7
	gtz8UdxNh9HEiADicztA74Z5cwrrFPYBfuuKiLDFMUihns78SxFlVR2w94jRLLNL
	ZIAHMBRWQVRTaz5dBdLCbyc/UgCDblK9mVA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795655571; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PGFzYWhpQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm2:rsa-sha256:a1UGoiYaheCJ5U6BCkgaLJ2e0couNLj4vZpgeos8sTg4xvi
	AXdwzEksoDfh7drzwg6EyLQ/70u03Q+FIbh2hPBzalt0qzr+ZLbpK+CCu9V3oe9p
	PyaaWwgCF0AfgWmx0QS9vktIww0sDcTJGqt8SGKRVdYT15pWvZm7s/+/ySPom6u7
	IMRXyeuF5Umwz5V8jG9C3Qf+CXHk3GTwtCoevJmbWRarM3XJ0XdFutATU2UJTkHb
	hIHVOMo7BmGrL3w2ZXyCxGalOOJPKLNflqs60wx5kcNjpCLcjJt5ZNNyVZZ+z9MD
	wIbNl+itroSfKuIsTpcOgwvkG3YZh5skOsYHMrA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Q0i1sTTQbcjmcXXT+M78PquS39tDib4K1VaPggSsh+0=:rq6xRGOu8WZ0gInXjlwLQNeu4yVsubQwpS0nHDS7kME=;
X-ME-Sender: <xms:k4cHa0GdHKbMWjJhotoLJn_zcVf207pWafl0MQHx794PRpGZKFVcoQ>
    <xme:k4cHayii4_XqdCUy5bfnX0Y_KfqidZnP271fQ488M8rTg0nkROttU27P5h9zpc0JX
    lFnVX7uW4y6p1l5SOk4HNnq94hJnQuwMN4KsacSRK6rnk8ompjFrohE>
X-ME-Received: <xmr:k4cHaxiD5oGhwklRRZMPphhiN4ortZMUD9XVTWU8rMiIKzmoICRtVyd-VtqYyr8-E7UJjZQhdJ2euhvHmoC5OAAhptmnEguzUlc>
X-ME-Proxy-Cause: dmFkZTG0rxQYipiteh89VTxNujjcq7oJ6AI8/b9/lv+JwM2PNH0ky658Zp0jDPofAzJsG/
    ZQu5GcTSXHhrU3CcJoy6C1K1bQ6vro+A6eC7QdoOX8XIi7t0s6yXZPqNDY+OjlxKoE9ktT
    NM7IrzlPvdpl06IqqwaOwQBopeNlKj0mag1R3fCYnHSHjpACcMAQRo/PrXW4G10Wx1WCUK
    kGKUeJF5Lw/g9x7ya2UlZTED5wT+xb9btslIHSuUF8BB8VfOS57evdqjRcOZN7OmEMv30c
    2yogudxI0ANUXjhDo6q/kjYUcoj7pVP9Z/oEWvePj73xUyqhiBEhGmHlt3pAHAO2l4kKGR
    Y4CBIQcVrQb6DY+gmtOQWinKB0jkTHvOlEVC9o1w974iuoERGgLMPyb5cGP3LpD2n1WImE
    Qqbnd27BfuiqTfhLl97qvXq/8+zFU7cNG/8z0LD5cDzV/iyI3Lljw9Vsh+bt8LNtSZlt2n
    dQX2+Czn2HFAu3i+bRVajncraUfveSIIBnymn1t9WteKrXWp9CIdeEf3mjgYM8z4b60+mZ
    HzTRNBHQeINorJluCDAtjpdKz3GaHN3tz4ieliS3tYZJ93TVGpAaDBi9/xvGP7EIzZuK+Q
    WtLqdO7SRx5uv5braDVAcRqtssFXojTA5Q6I691mMS1NSYjPLjkIOLiOYwcg
X-ME-Proxy: <xmx:k4cHa1mgK7EpLcXSceXoVGApuqd988gMOwDkBAdTklHoWjdj7k1rAQ>
    <xmx:k4cHa1bPKoQOvqZNC5DdBsV1PMBm1J6pexnGoRgZkHKR2HSYbHUP7g>
    <xmx:k4cHa4wLqrTcg5W3-Ou0zLXHfZ_4zw0CcMlaPu6yjNyEb8kNJoBInQ>
    <xmx:k4cHa8ZDkgJ7NQIM8n0CPol8tUetjjp2RBg-UmLgvtF7HASvpJQRNA>
    <xmx:k4cHa-kR7uPkcLcsUX9P6JEFTYrzqBkwfNjS64e6s98Ptm-2p8N9D0K3>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 20:12:50 -0500 (EST)
Date: Thu, 26 Nov 2026 02:12:49 +0100
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] phy: apple: atc: Split generation-specific code
Message-ID: <20261126011249.GF372978@robin.jannau.net>
References: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
 <20261125-t8122-phy-v3-5-196e20b3537e@chaosmail.tech>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125-t8122-phy-v3-5-196e20b3537e@chaosmail.tech>

On Wed, Nov 25, 2026 at 02:11:49PM +0100, Sasha Finkelstein wrote:
> atc.c is getting pretty big, split out the hardware generation-specific
> code into separate files.
> 
> Reviewed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/phy/apple/Makefile    |    2 +-
>  drivers/phy/apple/atc-t8103.c |  273 +++++++++
>  drivers/phy/apple/atc-t8122.c |  713 +++++++++++++++++++++++
>  drivers/phy/apple/atc.c       | 1286 +----------------------------------------
>  drivers/phy/apple/atc.h       |  340 +++++++++++
>  5 files changed, 1333 insertions(+), 1281 deletions(-)

from a code history and code churn point of view it would have been nice
if the split happened before or while adding t8122 support. Not sure if
it is worth the effort now that t8122 support already exists.

Janne
