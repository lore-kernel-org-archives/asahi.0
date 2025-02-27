Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBACD1AB6DE
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 17:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675728; cv=none; b=VJxU5PdXY6qyDKVYOrSKpUdE2L1qXI4QG78/1JwdFaD39q6wphQohrqec4aCXjtCUgqqEgU9++WbebR/VpATg3lSuGI/eWTv57ysOFg1+wQXrtNh48g1SQcNHcJToAzBw5Q7tf6lyweznLq0zTkL086fhQIeJ/CgnIyXeYOq9Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675728; c=relaxed/simple;
	bh=Xrcd65Zx52177pXz2X3OxgzXdbY9csWef6zPrPdXhdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHwFWxSKfGtkVVEgUHIYSPd+zWUzqmVc/R4VSrc5p2aTs4AhI12oPDZGmHBPyP6zooK4oln/PBlHEMVYK3urecKP+Jn1SSbUzqyEM6x7AP3rIa/YRqCs9cn6xiTaDqmKN+f0bs0CfxUw9P/des/e3Ot7Q2aAgVo3Gc1+p832Juc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=Kera79ZW; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="Kera79ZW"
Date: Thu, 27 Feb 2025 12:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740675714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5x59HniqPBqKKUIe7KYWznQqiJ8WVEBPJBvvS+VQjM0=;
	b=Kera79ZW3++yznfu3mAeSIAL6eOLHyPpNcGQKzcrdDdDb73e2Fh0TwnZ9Yq00rcKdFJNFQ
	5z1fb483MJ22YqTgDZOzt3kjh4/VwlPwvfvNt3VtNAoygbgrzMJG1iq206e4g+LgyCkZRi
	eomuOu1bEz4CFNaQfLF84y/U8KV1kvVxWDiAhcrDLrtTauVh7hLBJ/ZIQJeTKCHsddI1zI
	oKodu9pwXf6cr01Udyk0uXEzbjd/TdgQmHGwCp37InptMozO5CwDZkQ0Kn2HZ592bfdEFs
	321icTewVkrwRzENiVe6VErW1A4HQJ3TpaGfyVtncVF0tST5jW1zUP2XoiMdGA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/2] iommu: apple-dart: Allow mismatched bypass support
Message-ID: <Z8Cae58jLqcGwF8S@blossom>
References: <20250227-isp-dart-v1-0-161e91ef4f46@gmail.com>
 <20250227-isp-dart-v1-2-161e91ef4f46@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227-isp-dart-v1-2-161e91ef4f46@gmail.com>
X-Migadu-Flow: FLOW_OUT

> +		/* Will be ANDed with DART capabilities */
> +		cfg->supports_bypass = true;
...
> +	if (!dart->supports_bypass)
> +		cfg->supports_bypass = false;

Probably better to write

   cfg->supports_bypass &= dart->supports_bypass;

To match what's in the comment!
