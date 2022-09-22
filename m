Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DC83C26
	for <asahi@lists.linux.dev>; Thu, 22 Sep 2022 14:29:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 49BE944C65;
	Thu, 22 Sep 2022 14:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1663856972; bh=uspIl9LGe96i3dV8zEjsYdGYA7mcTRqfeZXjm1Wudnc=;
	h=Date:To:Cc:From:Subject;
	b=egSgGta2kLf3JeKvnzk7n65+B2MVdyVOo2U1UZVRvGFf1r0XMLyJHrgHxJZ69LaL8
	 Tf9yeLmmqovT0PeiHiQ9DmVjD6yEjBzEcTQKXId16A12+Ttw/4bGIaS7IvD41u1uxO
	 XhPxGPIe1C8O5zyXfhzf9XsVo2BbtxkcCfpcecf3zd6iqBMoYMI91NOiAOJevObjSZ
	 o6OIUZcl5VMwrWeiP8Ge+oYumyjgmSF8UPONSY33X3nFtiFqIrn6zGyatnidJ6S0YQ
	 dfdJnQ1n2eTg7VByKTexVMc+U4PSgw0oTzAie7CkqVtOEEecoKkdi5nuHXOCGVmWMN
	 CkWLLLe+f43IQ==
Message-ID: <2159b672-4db7-5add-8046-ed5354dd5343@marcan.st>
Date: Thu, 22 Sep 2022 23:29:29 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: es-ES
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
From: Hector Martin <marcan@marcan.st>
Subject: Please add asahi-soc to linux-next
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stephen,

Could you add the asahi-soc trees to linux-next? We are downstream from
SoC and would benefit from testing in linux-next before I send out PRs.

URLs:
https://github.com/AsahiLinux/linux.git asahi-soc/fixes
https://github.com/AsahiLinux/linux.git asahi-soc/for-next

(Right now we have no fixes, and some DT changes in for-next)

Thanks!

- Hector
