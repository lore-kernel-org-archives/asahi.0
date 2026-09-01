Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5F449B211
	for <asahi@lists.linux.dev>; Tue,  1 Sep 2026 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287075; cv=none; b=A2Xlrhysrh70jGDbsfVdWHmH44z1iMNvIe/wLtqKylcmER+0WZEIUMEzpJW0aQTgq/0xgiY4yWLnflLpf7Ijywwo8sXtWC0hgmBL9ZLwga/7c3llV2LA2S0o81vX5JU5ngq8Gf5XKoyeFWDVRDOKMFzWVPzhrXsKjdEQOL3GZ1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287075; c=relaxed/simple;
	bh=Dbvx0sDSqnoFXbOknr7ZXcd10mndDk1sduAHZUxLQcw=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=XVInADrW1oPmq1WqboIQleBkQdjTXRyt1EBPRaifYKcKP+Z7rtkxqjz7FuXUVL2dfPqbwIQvzlszeVFSvcXhyE2/SpPAFVbQsvYzsHBvEBQQWyWXdN81x3iUbSRfLtpZNpOVIDoSsqkodgP/9JalbXTofKf7SSkVxd3/rcaWBlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=C47RqzGM; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="C47RqzGM"
Received: by chaosmail.tech (Postfix) id BA34B1C7E88;
	Tue, 01 Sep 2026 18:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1788287070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gYkD1BDeagh/tU4CJQnf9fXkpvpMWmQPMRYmn9m9tvY=;
	b=C47RqzGMBN50QFiqeZghBFTLkfNglzevyGvp/t34nae41elfZ3+0Zyn4D2LV490ecC4wvk
	3FEW5djWGgMi2I3m1/DHHZCvzzJ85AiUeq6lc3q5fRrPggF3dwZ7SymBOkYxUQkkjokhHA
	+vf3qHLjjqkOSPkF7syqqnIwo2uUB3A=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v9 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260901-clapped-fled-2ae6126df5cc@spud>
Date: Tue, 1 Sep 2026 20:24:19 +0200
Cc: Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <F6BE1957-CB62-4D6A-ACA1-1521A14A3E23@chaosmail.tech>
References: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
 <20260901-t603x-spmi-v9-1-09e702e3b153@chaosmail.tech>
 <20260901-clapped-fled-2ae6126df5cc@spud>
To: Conor Dooley <conor@kernel.org>



> On Sep 1, 2026, at 19:41, Conor Dooley <conor@kernel.org> wrote:
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - apple,t8122-spmi
>> +          - apple,t6030-spmi
>> +          - apple,t6031-spmi
>> +then:
>> +  required:
>> +    - interrupt-controller
>> +    - "#interrupt-cells"
>> +    - interrupts
> 
> else: false?
> Or do the existing devices also support these?

Yes, they do, we are just not planning to use that.

