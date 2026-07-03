Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49936282F05;
	Fri,  3 Jul 2026 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072334; cv=none; b=h2Iqcqr9Tz1lLyLLmcGOCYOlc/vTDrutU9raVV4Xd+3NXJNxfJPKHGnLX8P6F+G5kdJwzhHxFE7zN/Hl1hWY32LHST1v2wqk4nzy+PY/JuZ1MSzFkNNYhImfpDVUJzZrWaAtH2bQq/5PVIV4skGWGn7Kf4fig1b9nwFU+NTxcR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072334; c=relaxed/simple;
	bh=aYhfIFavK+1hKnLZufQaPwNtSrp5cpBxxYWlNUIOlxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XystzmlVDA8NmK8XeitOx9Cdzs89WtPOkoEEmSrrftGnSatPVCtVS/c6rHNxZG4r/lU41SAYNJ9YiiAd4IG/sd2WjEBq/TFdwg5CSi0IHA2zn0o16gRUQSc0I5wzh2gAmdjuBg3YcgiX1ZnlGmnVlrn4KtrS1oj0VJ4qb4oY1bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtUbTTQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtUbTTQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CEB1F00A3A;
	Fri,  3 Jul 2026 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783072332;
	bh=zbH6EOaxJJwCRaD9Scc4jGAt/kQtlCmPLiShqgjHmu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YtUbTTQ3YcY991mOo25WNvGwKaUMGOgMXJtkYRzWNIqaO3m9busfvfeIgVVSegEpe
	 VLK1OyZtwnzS8g9JKKmn6OrOHH+Nt7+pA/I+0l+rcKAShqA+nt9XKUWCvHKhV9cFXB
	 71b4JlWf0DbrPtl0FxbVLN9MnclG5c7n3ZBA1rsyO67B0ZI+PalTS2PE2Hf2GMPq16
	 meqBprpcQAJ+kgGFGUj5SutsD1m2zFhJ0QyOwOEvtP/ifv38+kvvKlwR1c3pei2bUd
	 pmZQcU/TvosCWqsfPSSbCAHUuckJhomayHQPOnTIthay1HjLNJ3oaU5/Ls8npaWkAd
	 hKny2xpSoaW8A==
Date: Fri, 3 Jul 2026 11:52:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: apple: Add bindings for apple PMGR
 misc controls
Message-ID: <20260703-spotted-silver-nyala-b39ec4@quoll>
References: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
 <20260702-pmgr-misc-v1-1-4f075a3a95c1@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702-pmgr-misc-v1-1-4f075a3a95c1@chaosmail.tech>

On Thu, Jul 02, 2026 at 02:06:26PM +0200, Sasha Finkelstein wrote:
> Certain Apple SoCs include additional PMGR power states that are
> controlled via a different "misc" control block. On existing SoCs, this
> includes the fabric and memory controller state.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>

Just a nit on top of Conor's review, if there is a new version:

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Best regards,
Krzysztof

