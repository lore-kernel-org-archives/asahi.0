Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80524679F3
	for <asahi@lists.linux.dev>; Tue, 26 Mar 2024 10:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711448706; cv=none; b=c4hud8+aMKttBrOg0zdDtCnT8okydRgaA5tYdf5s+aBjQo3O5Wn/Bio3a+8YAzt0UiKc+FTM8OlCqFaXaLuJEb0+W6YD9Ag/0KqozDHa8Ma9aykj6hKHw0kbSUB6qp8cOU5HNvJTvCFRLigBRSnABE5gIcGmGItHQtdazfqB6Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711448706; c=relaxed/simple;
	bh=g0SU6NfLr+ZkOIla2tv8xgVMSPPkk6V7Uwp4t2Ksy3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=XPIioW9JbaW9pA/cKpeICrGrdDjnqo36CL8VyWqaMhhuSkiHlU6MZaO59gwlIXKeXKFzOgwmC47QiOL0e2TbSVRB9XOHR4zkEnmYA2qprhXp0rIzBAY6wuol2YH1pHFdkI93ok3kVSz9dcLVrtfLgkAjOP9Gx6m7a8zfe9KH8A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pVXcDVtt; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pVXcDVtt"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240326102454epoutp02c05782ea969fa23bd7aa8312624d092e~ASYU6t4cG0220902209epoutp021
	for <asahi@lists.linux.dev>; Tue, 26 Mar 2024 10:24:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240326102454epoutp02c05782ea969fa23bd7aa8312624d092e~ASYU6t4cG0220902209epoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1711448695;
	bh=8BsG80ZWjah583VEciKI6+aEIVkJPGAAnsoATkJLrr8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=pVXcDVttBjO/oRDUENiGyPrnmq411IHgFJFg+N+8gpN13FDmm4pxwy4y+Uyi/GkqN
	 IHCs1jnVM4xxtdeZDvWRDqvoVlon0BTyPIShtnKGlzm5OTt2FbSx2R4Pio/0p13w4/
	 pkqSN9G9oIDbwxgiPq6ryygL9dVJqK3QpMoVOWUk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20240326102454epcas5p1bff3d0b2fa8591cc91bc38ac68b2a78b~ASYUWEv7Z1459814598epcas5p1-;
	Tue, 26 Mar 2024 10:24:54 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4V3mBs1NYLz4x9Px; Tue, 26 Mar
	2024 10:24:53 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F1.5D.09665.572A2066; Tue, 26 Mar 2024 19:24:53 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240326102452epcas5p180a1ec343ea902673c682f2b24d8828a~ASYS7cj012415724157epcas5p1N;
	Tue, 26 Mar 2024 10:24:52 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240326102452epsmtrp2e24fd026a503399dbc0ad42a8f2d11c3~ASYS6qnbZ2248622486epsmtrp2B;
	Tue, 26 Mar 2024 10:24:52 +0000 (GMT)
X-AuditID: b6c32a4b-5cdff700000025c1-ef-6602a2759456
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	5E.76.08390.472A2066; Tue, 26 Mar 2024 19:24:52 +0900 (KST)
Received: from [107.122.11.51] (unknown [107.122.11.51]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240326102451epsmtip2c30d1ff3297b4f3cdc00b8166e90ed67~ASYRghOJ_1724217242epsmtip29;
	Tue, 26 Mar 2024 10:24:51 +0000 (GMT)
Message-ID: <0fd68aba-b116-3a0c-c864-909bf2d7e80c@samsung.com>
Date: Tue, 26 Mar 2024 15:54:49 +0530
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
	Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH 14/16] nvme: use the atomic queue limits update API
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Hector Martin <marcan@marcan.st>, Sven
	Peter <sven@svenpeter.dev>, Keith Busch <kbusch@kernel.org>, Sagi Grimberg
	<sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, Chaitanya
	Kulkarni <kch@nvidia.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
From: Kanchan Joshi <joshi.k@samsung.com>
In-Reply-To: <20240304140500.78583-15-hch@lst.de>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEJsWRmVeSWpSXmKPExsWy7bCmpm7pIqY0g7PbWS22nO5jtPh5lc9i
	5eqjTBa7F35ksph06BqjxdOrs5gs5i97ym5x+toCdot1r9+zWPy5/Z/Jgctj1v2zbB7n721k
	8di0qpPNY/OSeo8Xm2cyeuy+2cDmsXjZTjaP3uZ3bB5HJ85m9+if188UwBWVbZORmpiSWqSQ
	mpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDdK2SQlliTilQKCCxuFhJ
	386mKL+0JFUhI7+4xFYptSAlp8CkQK84Mbe4NC9dLy+1xMrQwMDIFKgwITuj++ZJxoKJXBUv
	t+9kbWBcw9HFyMEhIWAi0d5Y0cXIxSEksJtRYsqhE4wQzidGicOHVjFDON8YJfY/nMDSxcgJ
	1rFxywqoqr2MElembWaCcN4ySszsP8sKUsUrYCdxuGMWI4jNIqAqMW3jOzaIuKDEyZlPwCaJ
	CiRL/Ow6ABYXFnCXmNrziRnEZhYQl7j1ZD7YUBGB34wSXx4/ZYFIpEpsfPWTGeRwNgFNiQuT
	S0HCnAKGEmvXzocqkZfY/nYO2NkSAic4JP7tucoOcbaLRPu3zVC2sMSr41ugbCmJz+/2skHY
	yRKXZp5jgrBLJB7vOQhl20u0nuoH28sMtHf9Ln2IXXwSvb+fMEHCkVeio00IolpR4t6kp6wQ
	trjEwxlLoGwPiWMH7rFAwmoVo8SuH5NZJjAqzEIKlllI3p+F5J1ZCJsXMLKsYpRMLSjOTU8t
	Ni0wzksth0d4cn7uJkZwYtby3sH46MEHvUOMTByMhxglOJiVRHhbvjCkCfGmJFZWpRblxxeV
	5qQWH2I0BcbPRGYp0eR8YG7IK4k3NLE0MDEzMzOxNDYzVBLnfd06N0VIID2xJDU7NbUgtQim
	j4mDU6qB6U7LV7m50zJE+EsKXpjE/dgh4TZlRmLs3xNTXBROvN+2bq3B15aUX7cyS2dOa/mi
	dlHG9kVwm8Ux413Os13D9B/4Vqnn9n27c+GcUa/p2ueLlwZoVvO+3Fn1s8815tZ9zwc1sZPj
	JBTuLr7tcqO7ZOn3j6yshw5XfE05Jh4hF1ro2zSnqjhawnHC3OiG7IdZ5jd3pKg+Pp7l++XP
	8Tsr+zN9z+e9UJAKMMjVWuz6+/5i1djO690KNQ9z06bfT1n/UdLYqms77/ZYpw//uDiefYw9
	Ndm7qXqeB+P0zlcb1ywW7Zz5rZM7rd9xt+pzl9uv79pNDt4jvkQrcT6biBBva86kAg+71r/b
	svc4BL7VUWIpzkg01GIuKk4EAPgK65xVBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsWy7bCSvG7JIqY0g9YuPYstp/sYLX5e5bNY
	ufook8XuhR+ZLCYdusZo8fTqLCaL+cueslucvraA3WLd6/csFn9u/2dy4PKYdf8sm8f5extZ
	PDat6mTz2Lyk3uPF5pmMHrtvNrB5LF62k82jt/kdm8fRibPZPfrn9TMFcEVx2aSk5mSWpRbp
	2yVwZXTfPMlYMJGr4uX2nawNjGs4uhg5OSQETCQ2blnB2MXIxSEksJtRoufgeyaIhLhE87Uf
	7BC2sMTKf8/ZIYpeM0rc+feCBSTBK2AncbhjFiOIzSKgKjFt4zs2iLigxMmZT8BqRAWSJV7+
	mQg2SFjAXWJqzydmEJsZaMGtJ/OZQIaKCPwGGtr1D6iBAyiRKjH/XAhIjZDAKkaJk7PkQcJs
	ApoSFyaXgoQ5BQwl1q6dzwIxxkyia2sXI4QtL7H97RzmCYxCs5BcMQvJtllIWmYhaVnAyLKK
	UTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93EyM4BrW0djDuWfVB7xAjEwfjIUYJDmYlEd6W
	LwxpQrwpiZVVqUX58UWlOanFhxilOViUxHm/ve5NERJITyxJzU5NLUgtgskycXBKNTBZTNw4
	b0+L99ETnyb9WvJj2pmLG3/WpltnfPXJv8mqnLHlyTnmJwlT935Qe9eRvlle7vCG26d2Mi6f
	9vHIz59P3I/+2O80r0bia3hdkT7Pxxlbs7uud3ycfnHf9r+bF77uesQVlLLctu/JkT3Pu9jN
	F9pHbYyp7+x7YJBxnG/awb2pz6YEbY6NWujXcCJaVPyDftIeo+je7Tt2rOub6izPpD5RwLbL
	0K25luP//bk9a8MqDdPjJqxiN3cRLdVKKy+/3vnGNeVbjccpjsmiStveKU1njdBk1hO/rFXX
	7JDQpu+348Ah/baXeUvdVi9+tk3hPN+EY8oxq4Lvrp4r9uhF6KQ1W4IiF+x2viOhsXVOpxJL
	cUaioRZzUXEiAJq95AIwAwAA
X-CMS-MailID: 20240326102452epcas5p180a1ec343ea902673c682f2b24d8828a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240304140712epcas5p43f81cdf9f37d5206cd0ac7201ff16eb7
References: <20240304140500.78583-1-hch@lst.de>
	<CGME20240304140712epcas5p43f81cdf9f37d5206cd0ac7201ff16eb7@epcas5p4.samsung.com>
	<20240304140500.78583-15-hch@lst.de>

On 3/4/2024 7:34 PM, Christoph Hellwig wrote:
> @@ -2098,11 +2091,26 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
>   	ns->head->nuse = le64_to_cpu(id->nuse);
>   	capacity = nvme_lba_to_sect(ns->head, le64_to_cpu(id->nsze));
>   
> -	nvme_set_queue_limits(ns->ctrl, ns->queue);
> +	lim = queue_limits_start_update(ns->disk->queue);
> +	nvme_set_ctrl_limits(ns->ctrl, &lim);
>   	nvme_configure_metadata(ns->ctrl, ns->head, id, nvm);
> -	nvme_set_chunk_sectors(ns, id);
> -	if (!nvme_update_disk_info(ns, id))
> +	nvme_set_chunk_sectors(ns, id, &lim);
> +	if (!nvme_update_disk_info(ns, id, &lim))
>   		capacity = 0;
> +	nvme_config_discard(ns, &lim);
> +	if (IS_ENABLED(CONFIG_BLK_DEV_ZONED) &&
> +	    ns->head->ids.csi == NVME_CSI_ZNS) {
> +		ret = nvme_update_zone_info(ns, lbaf, &lim);
> +		if (ret) {
> +			blk_mq_unfreeze_queue(ns->disk->queue);
> +			goto out;
> +		}
> +	}
> +	ret = queue_limits_commit_update(ns->disk->queue, &lim);
> +	if (ret) {
> +		blk_mq_unfreeze_queue(ns->disk->queue);
> +		goto out;
> +	}

Not sure if this has been discussed already.
But do we need something that does not update the limit but still 
releases the mutex (q->limits_lock)?
If nvme_update_zone_info() returns error, the mutex will not be released.
