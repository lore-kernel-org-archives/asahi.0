Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B55B38C42E
	for <asahi@lists.linux.dev>; Thu,  2 Jul 2026 19:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020920; cv=none; b=aII8iEHj8Ck7JE4snYtypXvWSx3Zh+Y2532fLhkFsucEoen8TcXmTCy9cHXeRPTmETC+sMDnb/3ojUDN2yDAXfi7ZleXMZvsqTsyqXrrq4wCZWN4nt/ARXTXicJaf1zvC8byRWsTvbQ89eNBsjapDstvKlxforjA9tSpsvApqBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020920; c=relaxed/simple;
	bh=Kj18O54fK1pbDk2eoxrRJzyCFomk/x4UshRjF1lmSjI=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LwooR3RvdKnvVt6LbPYG+g39eznHCblhB3JJtIHq1pR/5AEuRC4uZG0tCoypO1TsTa0smAbhCRTz84LH2e3eK1NTUbSlPVoj+MPmzx9dXbRpJn/jbuvWT4M7FcUfCrgSxZrf13RcSH+G/Nm3OYfSA+vbNE7eJBl2BnSCV8+dfiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=TliEX+k5; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="TliEX+k5"
Received: by chaosmail.tech (Postfix) id C7EB21C888A;
	Thu, 02 Jul 2026 19:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783020916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kj18O54fK1pbDk2eoxrRJzyCFomk/x4UshRjF1lmSjI=;
	b=TliEX+k5ea3vKtsVz0nJMU/ZYYQuehaNekOASgLfittsbS+fidYCkYblpCH5eQa9+hvMki
	t5EFWBF+dIIqls2s8jeCCzcOl9GzYdGttmSyrDyY7LSzqMShJnemV1wrzPC/loe9WcvhG2
	rMs3IrWYjRAVmw7Fq7AEYQVlxbPxUE0=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] dt-bindings: soc: apple: Add bindings for apple PMGR
 misc controls
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260702-kitchen-census-d79e1abb9f36@spud>
Date: Thu, 2 Jul 2026 21:35:05 +0200
Cc: Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <3B16D291-0C5D-489A-B8F7-60ECCB85141E@chaosmail.tech>
References: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
 <20260702-pmgr-misc-v1-1-4f075a3a95c1@chaosmail.tech>
 <20260702-kitchen-census-d79e1abb9f36@spud>
To: Conor Dooley <conor@kernel.org>

On Jul 2, 2026, at 21:18, Conor Dooley <conor@kernel.org> wrote:
> Are t6000 and t6020 the "certain Apple SoCs"? I assume so. The bit about
> "existing SoCs" is confusing in a binding (although it would be ok in the
> commit message), because you run into language semantics that imply that
> this sentence is about devices to the ones you're addressing here. I
> think you can just do s/. On existing SoCs//. And add an s to the final
> "state" to make it "states".

t600{0,1,2}, t602{0,1,2}, t603{1,2,4} (no upstream DT for those yet)
It is kind of a long list, with most t6xxx ones on it.

> "dcs" means memory controller then?

It is memory controller related, unclear if this covers the entire
controller or a subset of it. The name comes from Apple device trees
and macos kernel logs

