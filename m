Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACE03A6B82
	for <asahi@lists.linux.dev>; Wed,  5 Aug 2026 16:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948878; cv=none; b=JOiCNO5jGVu2yawsZr8NyMTPlbGYWzezuDMdW0VlHfo9ljRYKcO8r+7CxHfXXuSOdklEw1Iq+YF839oOJTpAeh98JLRReQYOLcTlhExl8NguguSFdRNd6T7Hdo37nIrMOTXY04tdgtJ88roQG/2iWxojci4egZYK0SS7gNloWKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948878; c=relaxed/simple;
	bh=tMJCv+4NABLQQGWv1Q4HaIAxmPpUFXWtHV/qO+8cing=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=oPpTSXnE8Ae2QCr0I5YrCdYdplAaXJIF9Wmo6oik8fiLGh4J1JUAZ0OgafTFpNXLHQWL6qaidtElKfo9zyJJg5/HX0IUnfPNm50swlEQQf/qEGcs4XkKYouhul6+wZUhgxqowsDu+ViFFhuB2YsINigmlTJvtE3pspZAzJCljyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=Q06ks7hU; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="Q06ks7hU"
Received: by chaosmail.tech (Postfix) id 165641C8156;
	Wed, 05 Aug 2026 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785948872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i4wdnIB7yu8IgdNvMRTaaDTfvRZ6N+3RnRfrYjaJiDE=;
	b=Q06ks7hUmJV4IInkKO9zbb+/nkToSLWu+DxBFOgN80f92c/retducvabO14uvMIEx9m2K7
	2d7PwpZfIpvYefG/CBMsceKQvajBIf852sTmF+uNgzByujZhJk+OFKF8I+5YYlB9YFCb67
	W/sFtyVGlC82drTh25tjfzyQxVNJGQk=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v4 4/6] spmi: apple: Implement remaining commands
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260805121956.GD832571@robin.jannau.net>
Date: Wed, 5 Aug 2026 18:54:21 +0200
Cc: Sven Peter <sven@kernel.org>,
 Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Alba Mendez <me@alba.sh>
Content-Transfer-Encoding: 7bit
Message-Id: <735B8A2E-7E9B-40EC-9BAD-FE14232AAE6B@chaosmail.tech>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-4-c15a12d9a7d1@chaosmail.tech>
 <20260805121956.GD832571@robin.jannau.net>
To: Janne Grunau <j@jannau.net>

On Aug 5, 2026, at 14:19, Janne Grunau <j@jannau.net> wrote:
>> 
>> -static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>> -  u16 saddr, u8 *buf, size_t len)
>> +static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>> +  u16 param, const u8 *buf, size_t len, u8 *ibuf, size_t ilen)
> 
> Instead of two sets of not very distinctive variable names ("buf"/"len",
> "ibuf"/ilen") please use just buf/len and a boolean to indicate whether
> the command is a read or write if you insists of routing all commands
> through a single function. This can be simply added as first condition
> in the "while" iterating over the write/read buffers.

Tried it, ended up not working, as the buffers differ in constness



