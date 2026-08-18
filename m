Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D056384CD5;
	Tue, 18 Aug 2026 07:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787038131; cv=none; b=HHq5gE+L54ihmrqMQC1kKnhfDB5U2wV0UfR+wdGDa8dnA0W3Sd4XhEAtXvTgg5y7p92pXD/4sRAHb9zNTzd67+YNOqvfjLs4Lzetf02iULRibV5s60gBliGVaBqj1DToFEnumkYByJAspRIGHOXho1mwxz9miGdiiAdmsGtM0nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787038131; c=relaxed/simple;
	bh=3PZo8wseWcKm3v9Q+SIMnEhQWsXX12h2mdUD0ziXmHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSll0vSOdGcLVJOjE+5blpDQ2lIouVWt6RpVd9lfK7OJIOHtneNzZbGTRHEg3YNJXK8RSqIv2QwgpKS8VxzASE0pr2+Dn6Pz8TecGGlDLfohCqp9BoGMSVjk5qRnKvpfv0s92al07utM6Ff4zC1gEMlYTvZTdviRVgVB1m8icgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohR/R9IB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohR/R9IB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9998C1F000E9;
	Tue, 18 Aug 2026 07:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787038129;
	bh=j6S6pzN/r5a4ugmR332ckbGF/8T37R8VCHGDICYO4+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ohR/R9IB4KTGx7cONhyKqVxZoE2oNBAeJpnNfzN+7Ko6+5Ov7dG8OTg3bmQPsYmen
	 4QYxsQ9XZY3ss3+hKXTA42hzdnIV1le+dYC992kHD4+0XqAc9P9AAiXVUxhefB1Y5a
	 bS1u9CeeWJttlOzU1qmFfKcsHB68c2ToQOxXlLC7ljKogI3dL6XMM4BdCdPkdihlbf
	 N7ht+LYJNZAL1hsVrjyIcPAl00+fzRgnhL2L1yOA+5Scg2VEa9YZ8Gvq08SgIF4Iys
	 YQCOZIXBXX9MBbzGGZtDvZxKi6HKghAreQUzzke50P/FDwEGxaNnlitCiu6s1Kd2F7
	 AzvKYF0yKMgBQ==
Date: Tue, 18 Aug 2026 09:28:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Message-ID: <20260818-hysterical-quail-of-youth-44d7c1@quoll>
References: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
 <20260816-t603x-spmi-v6-1-c5ab87aa447b@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260816-t603x-spmi-v6-1-c5ab87aa447b@chaosmail.tech>

On Sun, Aug 16, 2026 at 12:26:21PM +0200, Sasha Finkelstein wrote:
> Add t603x and t8122 compatibles, interrupt support, and support for
> SPMI controllers that are not always-on.
> 
> Keeping the "interrupt-controller" property as optional, as taking the
> j514c as an example, we only need this functionality on 3 out of 10
> SPMI controllers present on this SoC.

Should be required for the new devices and disallowed for all others, if
it is not present there - both in allOf:if:then: blocks after
"required:".

Best regards,
Krzysztof

